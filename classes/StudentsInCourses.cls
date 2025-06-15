public class StudentsInCourses{
    //-----------------------Questions-------------------------------------
    //----Q1----
    public static void avarageMachshevim(){
        List<AggregateResult> StudentLst = [SELECT Student__r.Class__c, Avg(RishumToCourse__c.Average__c) AvGrade, Course__r.Subject__c 
                                            FROM RishumToCourse__c
                                            GROUP BY Course__r.Subject__c, Student__r.Class__c
                                            HAVING Course__r.Subject__c = 'SQL'];

        List<RishumToCourse__c> NamesLst = [SELECT Name
                                            FROM RishumToCourse__c
                                            WHERE Course__r.Subject__c = 'SQL'];
        system.debug(StudentLst);
        system.debug(NamesLst);
    }

    //----Q2----
    public static void attendancePercentageLess60(){
        list<RishumToCourse__c> AttendanceLst = [SELECT Student__r.Name, Course__r.Subject__c, AttendacePercentage__c
                                                 FROM RishumToCourse__c];
        system.debug(AttendanceLst);
    }

    //----Q3----
    public static void ditelsSubject(){
        List <RishumToCourse__c> DetailslsSubjectLst = [SELECT Student__r.Name, Course__r.Subject__c
                                                        FROM RishumToCourse__c 
                                                        WHERE Course__r.Subject__c = 'Java'];
        system.debug(DetailslsSubjectLst);
    }

    //----Q4----
    public static void detailsCourses(){
        List <RishumToCourse__c> DetailsCoursesLst = [SELECT Student__r.Name, Course__r.Name, Course__r.Subject__c 
                                                      FROM RishumToCourse__c 
                                                      WHERE Course__r.Subject__c = 'SF' Or Course__r.Subject__c = 'SQL'];
        system.debug(DetailsCoursesLst);
    }

    //----Q5----
    public static void notHaveStudent(){
        List<AggregateResult> NotHaveStudentLst = [SELECT Course__r.Name
                                                   FROM RishumToCourse__c
                                                   GROUP BY Course__r.Name
                                                   HAVING COUNT(id) = 0];
        system.debug(NotHaveStudentLst);
    }

    //----Q6----
    public static void enrollmentDate(){
        List<RishumToCourse__c> EnrollmentDateLst = [SELECT Student__r.Name, Course__r.Name, RishumToCourse__c.EnrollmentDate__c
                                                     FROM RishumToCourse__c  
                                                     ORDER BY RishumToCourse__c.EnrollmentDate__c ASC];
        system.debug(EnrollmentDateLst);
    }

    //----Q7----
    public static void newStudent(){
        List<RishumToCourse__c> NewStudentLst = [SELECT Student__r.Name, RishumToCourse__c.EnrollmentDate__c
                                                 FROM RishumToCourse__c 
                                                 WHERE RishumToCourse__c.EnrollmentDate__c >= 2023-01-01 
                                                 AND RishumToCourse__c.EnrollmentDate__c < 2024-01-01];
        system.debug(NewStudentLst);
    }

    //----Q8----
    public static void detailsAboutTeacher(){
        List<Course__c> detailsAboutTeacherLst = [SELECT Name, Subject__c
                                                  FROM Course__c];
                                                 // WHERE Teacher__r.Name = 'שרה לוי'
        system.debug(detailsAboutTeacherLst);
    }
    
    //----Q9----
    public static void class12Student(){
        List<Student__c> Class12StudentLst = [SELECT Name
                                              FROM Student__c
                                              WHERE Class__c = 'י"ב'];
        system.debug(Class12StudentLst);
    }
}