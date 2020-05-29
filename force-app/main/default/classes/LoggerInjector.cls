/**
* @author Abhishek Sivasubramanian
* @date 2020
* @description Class responsible for initializing the instance of the logger
*/
public class LoggerInjector 
{
    private static Type loggerType = LoadLogger();

    /**
    * @author Abhishek Sivasubramanian
    * @date 2020
    * @description Method that returns the instance of the logger type
    */
    public static ILogger GetLogger()
    {
        return (ILogger)loggerType.newInstance();
    }

    /**
    * @author Abhishek Sivasubramanian
    * @date 2020
    * @description Set the loggerType property in this class by calling the DI Container
    */
    private static Type LoadLogger()
    {
        DIContainer.Metadata container = DIContainer.load();
        String className = container.logger;
        Type serviceType = Type.forName(className);
        if(serviceType == null)
        {
            throw new UnknownImplementationException('Could not load '+ className +' class: class not found');
        }
        else if (!(serviceType.newInstance() instanceof ILogger)) 
        {
            throw new InvalidImplementationException('Could not load '+ className +' class: class does not implement ILogger');
        }
        else 
        {
            loggerType = serviceType;
        }
        return loggerType;
    }

    public class UnknownImplementationException extends Exception {}
    public class InvalidImplementationException extends Exception {}
}
