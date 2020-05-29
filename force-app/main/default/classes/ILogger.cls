/**
* @author Abhishek Sivasubramanian
* @date 2020
* @description Interface that specifies the contract of how a message should be logged
*/
public interface ILogger 
{
    /**
    * @description Logs the request
    * @param ApexLogRequest the request that encapsulates data to be logged
    * @return none
    */
    void LogMessage(ApexLogRequest request);
}
