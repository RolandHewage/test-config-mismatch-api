import ballerina/http;
import ballerina/log;

configurable string emailServiceBaseUrl = "df";
configurable http:OAuth2ClientCredentialsGrantConfig oauthConfig = ?;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        log:printInfo(oauthConfig.tokenUrl);
        log:printInfo(emailServiceBaseUrl);
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}
