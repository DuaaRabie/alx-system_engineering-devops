#!/usr/bin/python3
""" Export data in the JSON format for all employees """
import json
import requests

if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/"
    
    # Fetch all users (employees)
    users = requests.get(url + "users").json()

    # Prepare a dictionary to store tasks for all users
    all_users_data = {}

    # Loop through all users to get their tasks
    for user in users:
        user_id = str(user.get("id"))
        # Fetch tasks for the current user
        todos = requests.get(url + "todos", params={"userId": user_id}).json()
        
        # Format the tasks data for this user
        all_users_data[user_id] = [{
            "username": user.get("username"),
            "task": task.get("title"),
            "completed": task.get("completed")
        } for task in todos]

    # Write the data to a JSON file named todo_all_employees.json
    with open("todo_all_employees.json", "w") as jsonfile:
        json.dump(all_users_data, jsonfile, indent=4)
