const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "FlutterAmplifyDataStoreDemo": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://xwf7ldlxx5hmvmzrf76wojnxnq.appsync-api.us-west-2.amazonaws.com/graphql",
                    "region": "us-west-2",
                    "authorizationType": "API_KEY",
                    "apiKey": "da2-rykbbefwtbbrdlav4yevpquiuq"
                }
            }
        }
    },
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://xwf7ldlxx5hmvmzrf76wojnxnq.appsync-api.us-west-2.amazonaws.com/graphql",
                        "Region": "us-west-2",
                        "AuthMode": "API_KEY",
                        "ApiKey": "da2-rykbbefwtbbrdlav4yevpquiuq",
                        "ClientDatabasePrefix": "FlutterAmplifyDataStoreDemo_API_KEY"
                    },
                    "FlutterAmplifyDataStoreDemo_AWS_IAM": {
                        "ApiUrl": "https://xwf7ldlxx5hmvmzrf76wojnxnq.appsync-api.us-west-2.amazonaws.com/graphql",
                        "Region": "us-west-2",
                        "AuthMode": "AWS_IAM",
                        "ClientDatabasePrefix": "FlutterAmplifyDataStoreDemo_AWS_IAM"
                    }
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "us-west-2:0c427bc7-42f2-4e68-82fa-ec50d7ab0011",
                            "Region": "us-west-2"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "us-west-2_nLYf9XKo3",
                        "AppClientId": "7v584r7cmtkrungh05j1iajqcs",
                        "Region": "us-west-2"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH"
                    }
                }
            }
        }
    }
}''';