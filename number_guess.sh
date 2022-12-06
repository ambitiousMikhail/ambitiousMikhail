#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#create function
function GET_USERNAME() {
  echo Enter your username:
  read USERNAME
}

GET_USERNAME

# if username is null
until [[ -n $USERNAME ]]
do
  GET_USERNAME again
done

# get name for database
NAME=$($PSQL "SELECT DISTINCT(name) FROM number_guess WHERE name='$USERNAME'")

# if the name isn't found
if [[ -z $NAME ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."

# if the name found
else
  # count games
  COUNT_GAMES=$($PSQL "SELECT count(game_id) FROM number_guess WHERE name='$NAME'")

  # best game
  BEST_GAME=$($PSQL "SELECT min(number) FROM number_guess WHERE name='$NAME'")

  # output 
  echo "Welcome back, $NAME! You have played $COUNT_GAMES games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"

# a secret number generation
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
COUNT_GUESSES=0

# read number
function GET_NUMBER() {
  read NUMBER
}

# if number is not integer
function NOT_INTEGER() {
  until [[ $NUMBER =~ ^[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
    GET_NUMBER again
  done
}

GET_NUMBER
NOT_INTEGER

until [[ $NUMBER == $SECRET_NUMBER ]]
do
  # if number lower than
  if [[ $NUMBER -lt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    
    #count number of guesses
    COUNT_GUESSES=$(( COUNT_GUESSES + 1 ))
    
    GET_NUMBER again
    NOT_INTEGER again

  # if number higher than
  else
    echo "It's higher than that, guess again:"

    #count number of guesses
    COUNT_GUESSES=$(( COUNT_GUESSES + 1 ))

    GET_NUMBER again
    NOT_INTEGER again
  fi
done

#count number of guesses
COUNT_GUESSES=$(( COUNT_GUESSES + 1 ))

echo "You guessed it in $COUNT_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

#insert a new number guessing game
INSERT_GAME=$($PSQL "INSERT INTO number_guess(name, number) VALUES('$USERNAME', $COUNT_GUESSES)")
