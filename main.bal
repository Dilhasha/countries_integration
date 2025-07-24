import ballerina/http;

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
        Country[] countries = check countriesClient->/countries;
        return countries;
    }
}