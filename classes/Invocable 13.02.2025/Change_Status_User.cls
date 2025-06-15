public with sharing class Change_Status_User {
    public class InPut{
        @invocableVariable(label = 'User Records List')
        public List<User> UserList;
    }
    @invocableMethod(label = 'Change Status User')
    public static void ChangeStatusUser(List<InPut> IdsLst) {
        List<User> UsersLst = IdsLst[0].UserList;
        List<User> UserStatusToUpdateLst = new List<User>();

        for (User user : UsersLst) {
            if(user.Profile.Name != 'System Administrator' && user.IsActive != false){
                user.IsActive = false;
                UserStatusToUpdateLst.add(user);
            } 
        }
        if (!UserStatusToUpdateLst.isEmpty()) 
            update UserStatusToUpdateLst;
    }
}