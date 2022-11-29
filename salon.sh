#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

echo -e "Welcome to My Salon, how can I help you?\n"

SERVICE_BAR() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  #display services
  SERVICE_MENU=$($PSQL "SELECT * FROM services ORDER BY service_id")
  echo "$SERVICE_MENU" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME" 
  done
  
  #read number service id selected
  read SERVICE_ID_SELECTED

  #if input is not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    #send to menu service
    SERVICE_BAR "I could not find that service. What would you like today?"
  
  else

    #get service id
    SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    
    #if sirvice id is not found
    if [[ -z $SERVICE_ID ]]
    then

      #send to menu service
      SERVICE_BAR "I could not find that service. What would you like today?"
    
    else

      #read customer phone
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE

      #if customer phone is null
      if [[ -z $CUSTOMER_PHONE ]]
      then

        #send to menu service
        SERVICE_BAR "I could not find that service. What would you like today?"
      
      else

        #get customer id
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

        #if not found customer id
        if [[ -z $CUSTOMER_ID ]]
        then

          #get a new customer name
          echo -e "\nI don't have a record for that phone number, what's your name?"
          read CUSTOMER_NAME

          #if name is null
          if [[ -z $CUSTOMER_NAME ]]
          then

            #send to menu service
            SERVICE_BAR "I could not find that service. What would you like today?"

          else

            #insert new customer
            INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")  
          
          fi
        fi
      fi

      #get name service selected
      SERVICE_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID")
      
      #formatted name service selected
      SERVICE_SELECTED_FORMATTED=$(echo $SERVICE_SELECTED | sed -r 's/^ *| *$//g')
      
      #get customer id again
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

      #get customer name
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
      
      #formatted customer name
      CUSTOMER_NAME_FORMATTED=$(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')
      
      #read service time
      echo -e "\nWhat time would you like your $SERVICE_SELECTED_FORMATTED, $CUSTOMER_NAME_FORMATTED?"
      read SERVICE_TIME

      #if service time is null
      if [[ -z $SERVICE_TIME ]]
      then

        #send to menu service
        SERVICE_BAR "I could not find that service. What would you like today?"

      else

        #returned final sentence
        echo -e "\nI have put you down for a $SERVICE_SELECTED_FORMATTED at $SERVICE_TIME, $CUSTOMER_NAME_FORMATTED."

        #insert appointment result
        INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")

      fi
    fi
  fi
}

SERVICE_BAR