public with sharing class SchedulableExecuteAsinc implements Schedulable {
    public SchedulableExecuteAsinc() {

    }

    public static void execute(SchedulableContext sdlb){
        system.enqueueJob(new QueueableData(), 100);

       
    }

    
}