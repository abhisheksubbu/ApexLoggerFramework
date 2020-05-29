/**
* @author Abhishek Sivasubramanian
* @date 2020
* @description Test Client Class that shows how to use the Logger Framework
*/
public class Client 
{
    private ILogger logger;
    /**
    * @description Constructor that gets the logger instance from the framework
    */
    public Client()
    {
        logger = LoggerInjector.GetLogger();
    }
    /**
    * @description Demo method that shows how to create the request and pass it to logger
    * @return none
    */
    public void RunSomething()
    {
        try 
        {
            
        } 
        catch (Exception ex) 
        {
            ApexLogRequest logRequest = new ApexLogRequest();
            logRequest.ClassName = 'Client';
            logRequest.MethodName = 'RunSomething';
            logRequest.SObjectType = 'something';
            logRequest.ObjectIds = new String[] {'1', '2'};
            logRequest.ExceptionObject = ex;
            logRequest.Level = LogLevel.Error;

            logger.LogMessage(logRequest);
        }
    }
}
