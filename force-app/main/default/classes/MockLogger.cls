/**
* @author Abhishek Sivasubramanian
* @date 2020
* @description Concrete implementation of the ILogger used for Framework testing
*/
public class MockLogger implements ILogger 
{
    /**
    * @description Logs the request
    * @param ApexLogRequest the request that encapsulates data to be logged
    * @return none
    */
    public void LogMessage(ApexLogRequest request)
    {
        //Log the Message
    }
}