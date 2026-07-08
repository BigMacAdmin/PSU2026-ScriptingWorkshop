#!/bin/zsh --no-rcs
# shellcheck disable=SC1071
#set -x

# UserReport.sh checks every account on the system and reports basic facts:
# admin or standard
# UID
# Secure Token Status

#username="nonadmin"

# Read the command at the end of this while loop line by line (dscl . -list /Users UniqueID )
## This command gives us two columns, while we read each line, the first column value wiill be set to "username"
## We could use the second column to set UserID, but in our exercise we used the `id` command to do this later on
while read -r username currentUID; do
    # If this account is user ID less than 501, or if it starts with an underscore, it's a service account. Skip it.
    if [[ "$currentUID" -lt 501 ]] || [[ "$currentUser" == _* ]]; then
        continue
    fi

    # Set our admin and secure token variables to false to start
    userIsAdmin=false
    secureTokenResult=false

    # Check if the user is an administrator
    ## We can use the `dseditgroup` command to see if the user is a member of the 'admin' group
    if dseditgroup -o checkmember -m "${username}" 'admin' &> /dev/null; then
        # User is in the admin group, so change our variable to 'true`'
        userIsAdmin=true
    fi

    # Get the User ID of this user
    userID="$(id -u "${username}")"

    # Get the secure token status of this user
    secureTokenStatus="$(sysadminctl -secureTokenStatus "${username}" 2>&1 )"

    # If result of the previous command contains the string "is ENABLED for" then there is a Secure Token
    if [[ "$secureTokenStatus" == *"is ENABLED for"* ]];then
        secureTokenResult=true
    fi

    # Print our report to standard out
    echo "Username: ${username}"
    echo "User is Admin: ${userIsAdmin}"
    echo "User ID: ${userID}"
    echo "Secure Token Status: $secureTokenResult"
    # Add a separator, because this is a "human-readable" report
    echo "----------"

    # Done with our loop. The command below is what "feeds" our loop, it lists all users on the device
done < <(dscl . -list /Users UniqueID)

