/**
* @author Abhishek Sivasubramanian
* @date 2020
* @description Logger Framework Test Class
*/
@IsTest
private class LoggerFrameworkTests 
{
    /**
    * @description Test ensures that the Custom Metadata has been populated with Service Registration record
    * @return none
    */
    @IsTest
    static void DIContainer_GetServiceRegistration_Test()
    {
        boolean hasConfigurations = true;
        try 
        {
            List<DI_Container__mdt> serviceRegistrations = DIContainer.getServiceRegistrations();
            if(serviceRegistrations==null || serviceRegistrations.size()==0)
                hasConfigurations = false;
        }
        catch (Exception ex) 
        {
            hasConfigurations = false;
        }
        system.assert(hasConfigurations);
    
    }

    /**
    * @description Test ensures that the DI Container returns the Correct Logger
    * @return none
    */
    @IsTest
    static void DIContainer_HasCustomMetadataRecord_Test()
    {
        boolean exceptionCaught = false;
        try 
        {
            DI_Container__mdt containerMetadata = new DI_Container__mdt();
            containerMetadata.DeveloperName = 'ServicesRegistration';
            containerMetadata.Logger__c = 'MockLogger';

            DIContainer.serviceRegistrations = new List<DI_Container__mdt>{
                containerMetadata
            };

            DIContainer.Metadata metadata = DIContainer.load();
            system.assert(String.isNotBlank(metadata.logger));
        } 
        catch (Exception ex) 
        {
            exceptionCaught = true;
        }
        system.assert(!exceptionCaught);
    }

    /**
    * @description Test ensures that the framework throws exception if the custom metadata is not existent
    * @return none
    */
    @IsTest
    static void DIContainer_DoesNotHaveCustomMetadataRecord_Test()
    {
        boolean exceptionCaught = false;
        try 
        {
            DIContainer.Metadata metadata = DIContainer.load();
        } 
        catch (Exception ex) 
        {
            exceptionCaught = true;
            system.assertEquals('Could not find DI_Container__mdt Service Registrations', ex.getMessage());
        }
        system.assert(exceptionCaught);        
    }

    /**
    * @description Test ensures that the framework throws exception if the custom metadata exists but doesn't have records
    * @return none
    */
    @IsTest
    static void LoggerInjector_DoesNotHaveCustomMetadataRecord_Test()
    {
        boolean exceptionCaught = false;
        try 
        {
            Ilogger logger = LoggerInjector.GetLogger();
        } 
        catch (Exception ex) 
        {
            exceptionCaught = true;
        }
        system.assert(exceptionCaught);
    }

    /**
    * @description Test ensures that the corect logger instance is returned by the Framework
    * @return none
    */
    @IsTest
    static void LoggerInjector_HasCustomMetadataRecord_Test()
    {
        boolean exceptionCaught = false;
        try 
        {
            DI_Container__mdt containerMetadata = new DI_Container__mdt();
            containerMetadata.DeveloperName = 'ServicesRegistration';
            containerMetadata.Logger__c = 'MockLogger';

            DIContainer.serviceRegistrations = new List<DI_Container__mdt>{
                containerMetadata
            };

            Ilogger logger = LoggerInjector.GetLogger();
            system.assert(logger!=null);
        } 
        catch (Exception ex) 
        {
            exceptionCaught = true;
        }
        system.assert(!exceptionCaught);
    }

    /**
    * @description Test ensures that the framework throws exception if DI Container registers a class that doesn't exist
    * @return none
    */
    @IsTest
    static void LoggerInjector_HasCustomMetadataRecord_NoSuchClass_Test()
    {
        boolean exceptionCaught = false;
        try 
        {
            DI_Container__mdt containerMetadata = new DI_Container__mdt();
            containerMetadata.DeveloperName = 'ServicesRegistration';
            containerMetadata.Logger__c = 'NoSuchClass';

            DIContainer.serviceRegistrations = new List<DI_Container__mdt>{
                containerMetadata
            };

            Ilogger logger = LoggerInjector.GetLogger();
        } 
        catch (Exception ex) 
        {
            exceptionCaught = true;
        }
        system.assert(exceptionCaught);
    }

    /**
    * @description Test ensures that the framework throws exception if DI Container registers a class that doesn't implement the ILogger interface
    * @return none
    */
    @IsTest
    static void LoggerInjector_HasCustomMetadataRecord_ClassNotCorrectType_Test()
    {
        boolean exceptionCaught = false;
        try 
        {
            DI_Container__mdt containerMetadata = new DI_Container__mdt();
            containerMetadata.DeveloperName = 'ServicesRegistration';
            containerMetadata.Logger__c = 'ApexLogRequest';

            DIContainer.serviceRegistrations = new List<DI_Container__mdt>{
                containerMetadata
            };

            Ilogger logger = LoggerInjector.GetLogger();
        } 
        catch (Exception ex) 
        {
            exceptionCaught = true;
        }
        system.assert(exceptionCaught);
    }
}
