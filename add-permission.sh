export ACCOUNTID=$(aws sts get-caller-identity | jq -r .Account)
export REGION=$(aws configure get default.region)

aws lambda add-permission \
    --function-name helloworld \
    --action lambda:InvokeFunction \
    --statement-id open-api-invoke-any \
    --principal apigateway.amazonaws.com \
    --source-arn arn:aws:execute-api:${REGION}:${ACCOUNTID}:*/*/GET/*

