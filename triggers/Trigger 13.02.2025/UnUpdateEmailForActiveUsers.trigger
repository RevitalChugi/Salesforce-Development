trigger UnUpdateEmailForActiveUsers on User (before update) {
    Map<Id, String> oldEmailMap = new Map<Id, String>();

    for (User oldUserDitels : Trigger.old) {
        oldEmailMap.put(oldUserDitels.Id, oldUserDitels.Email);
    }

        for (User user : Trigger.new) {
            if(user.IsActive){
                if(user.Profile.Name != 'System Administrator'){
                    if(user.Email != oldEmailMap.get(user.Id)) // Trigger.oldMap.get(user.Id).Email
                        user.Email.addError('You Try To Change Email For Active User');
                }
            } 
        }
}