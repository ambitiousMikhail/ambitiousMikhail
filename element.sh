#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $* ]]
then
  echo Please provide an element as an argument.
else
  # if input is not a number
  if [[ ! $* =~ ^[0-9]+$ ]]
  then
    #get atomic_number if input is a number
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$*' OR name='$*'")
  else
    #get atomic_number if input is not a number
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$*")
  fi
  if [[ -z $ATOMIC_NUMBER ]]
  then
    echo "I could not find that element in the database."
  else
    #get info element
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
    NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
    TYPE=$($PSQL "SELECT type FROM properties INNER JOIN types USING(type_id) WHERE atomic_number=$ATOMIC_NUMBER")
    ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
    MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
    BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")

    #formatting info element
    ATOMIC_NUMBER_FOR=$(echo $ATOMIC_NUMBER | sed -r 's/^ *| *$//g')
    SYMBOL_FOR=$(echo $SYMBOL | sed -r 's/^ *| *$//g')
    NAME_FOR=$(echo $NAME | sed -r 's/^ *| *$//g')
    TYPE_FOR=$(echo $TYPE | sed -r 's/^ *| *$//g')
    ATOMIC_MASS_FOR=$(echo $ATOMIC_MASS | sed -r 's/^ *| *$//g')
    MELTING_POINT_FOR=$(echo $MELTING_POINT | sed -r 's/^ *| *$//g')
    BOILING_POINT_FOR=$(echo $BOILING_POINT | sed -r 's/^ *| *$//g')

    echo "The element with atomic number $ATOMIC_NUMBER_FOR is $NAME_FOR ($SYMBOL_FOR). It's a $TYPE_FOR, with a mass of $ATOMIC_MASS_FOR amu. $NAME_FOR has a melting point of $MELTING_POINT_FOR celsius and a boiling point of $BOILING_POINT_FOR celsius."
  fi
fi