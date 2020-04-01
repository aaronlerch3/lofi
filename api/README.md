# api

used for crud users, objects, etc.

The User Pool needs to be deployed first and then the JWKS URL needs to be updated in the auth function.

# List of Auth Functions

Functions sit in `/functions` folder

|Name|Description|Requires Identity Pool?|
|---|---|:-:|
|auth|Provides basic authentication with a User Pool. Checks the aud claim, expiration and validity of the JWT.|N


# Deployment

With MFA enabled on the AWS account, we need to first grab a temporary session token and use it. 

1 - Get an AWS Temporary Session Token:
```bash
pip install awsmfa
awsmfa -i <Profile>
```

2 - Run Serverless Deployment

```bash
    serverless deploy
```

# Testing The Authenticated Endpoint

Sign in using AWS Amplify to grab the token. The token can be seen from:

```javascript
let jwtToken = Auth.currentSession().then(function(result) {
    console.log(result);
});
```

Then curl:

```bash
curl -v -H "Authorization: Bearer <TOKEN>" https://<redacted>.execute-api.ap-southeast-2.amazonaws.com/dev/authenticated
```


# Clean Up

```bash
    serverless remove -v --aws-profile TEMPSESSION
```
