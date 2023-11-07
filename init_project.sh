#!/bin/bash
 
menu(){
echo "choose the project type to create a project"
echo "1. Python" 
echo "2. Bash"
echo "3. Exit" 
}

create_python() {
    read -p "Enter the project name: " project

    # Create the project directory
    mkdir -p "$project"
    cd "$project" || exit 

    # Create a Python file
    touch main.py
    echo "Python project setup completed"
    # Set up a virtual env
    python -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt

  # Generate README with Python-specific instructions
    cat << EOF > README.md
  # Project: $project_name

  ## General Setup Guide

  1. Clone the project repository.
  2. [Add any additional setup steps here.]

  ## Running the Python Project

  To run the Python project, follow these steps:

  1. Run the main Python file:
   \`\`\`bash
   python main.py
   \`\`\`
EOF
}

create_bash() {
    read -p "Enter the project name: " project

    # Create the project directory
    mkdir -p "$project"
    cd "$project" || exit 

    # Create a bash file
    touch main.sh
    echo" Bash project setup completed"
    # Generate README with Bash-specific instructions
    cat << EOF > README.md
    # Project: $project_name
    ## General Setup Guide
    1. Clone the project repository.
    2. [Add any additional setup steps here.]

    ## Running the Bash Project
    To run the Bash project, follow these steps:
    1. Make the main Bash file executable:
     \`\`\`bash
     chmod +x main.sh
    2. Run the main Bash file:
     ./main.sh
EOF
}

menu
 read -p "choose from the menu above(number): " choice
 case $choice in
   1)
      create_python
       ;;
   2)
      create_bash
       ;;   
   3) 
       exit;; 
 esac
