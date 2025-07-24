import ballerina/http;
import ballerina/log;

public type Country record {
    string name;
    string continent;
    int population;
    decimal gdp;
    decimal area;
};

final http:Client countriesClient = check new ("https://dev-tools.wso2.com/gs/helpers/v1.0/");

service / on new http:Listener(8080) {

    resource function get countries() returns Country[]|error {
        // Sending a GET request to the "/countries" endpoint and retrieving an array of `Country` records.

        log:printInfo("Fetch countries..");
        Country[] countries = check countriesClient->/countries;
        log:printDebug(`Replying with the list of countries, ${countries}`);
        return countries;
    }
}
