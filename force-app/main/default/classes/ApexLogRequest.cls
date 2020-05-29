/**
* @author Abhishek Sivasubramanian
* @date 2020
* @description Request Class that encapsulates all the data to be logged
*/
public class ApexLogRequest 
{
    public String ClassName;
    public String MethodName;
    public String SObjectType;
    public String[] ObjectIds;
    public Exception ExceptionObject;
    public LogLevel Level;
}
