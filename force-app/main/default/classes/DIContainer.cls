/**
* @author Abhishek Sivasubramanian
* @date 2020
* @description Dependency Inversion Container that pulls the service registration mappings for the framework
*/
public class DIContainer 
{
    private static Metadata settings = null;
    public static List<DI_Container__mdt> serviceRegistrations = new List<DI_Container__mdt>();

    /**
    * @description Loads the Metadata object with the Service Registrations
    * @return Metadata
    */
    public static Metadata load()
    {
        if (settings == null)
        {
            if(!Test.isRunningTest())
            {
                serviceRegistrations = getServiceRegistrations();
            }
                
            if (serviceRegistrations.size() == 0) {
                throw new DIMetadataException('Could not find DI_Container__mdt Service Registrations');
            }
            settings = new Metadata(serviceRegistrations.get(0));
        }
        return settings;
    }

    /**
    * @author Abhishek Sivasubramanian
    * @date 2020
    * @description Encapsulated and Abstracted form of the custom metadata
    */
    public class Metadata
    {
        public String logger {get;set;}

        private Metadata(DI_Container__mdt metadata)
        {
            this.logger = metadata.Logger__c;
        }
    }

    public class DIMetadataException extends Exception {}

    /**
    * @description Queries the custom metadata values
    * @return List of custom metadata records
    */
    public static List<DI_Container__mdt> getServiceRegistrations()
    {
        return [SELECT Logger__c FROM DI_Container__mdt where DeveloperName='ServicesRegistration' LIMIT 1];
	} 
}
