import json
import os
import base64
import boto3
import uuid
from contextlib import closing


def lambda_handler(event, context):
    print(event)
    givenText = json.loads(event['body'])
    givenText = givenText['text']
    print(givenText)
    client = boto3.client('polly')
    data = client.synthesize_speech(OutputFormat='mp3', Text= givenText, VoiceId='Joanna')
    postId = str(uuid.uuid1())
    if "AudioStream" in data:
        with closing(data["AudioStream"]) as stream:
            output = os.path.join("/tmp/", postId)
            with open(output, "ab") as file:
                file.write(stream.read())

    s3 = boto3.client('s3')
    s3.upload_file('/tmp/' + postId, 
      os.environ['BUCKET'], 
      postId + ".mp3")
      
    preSignedUrl = s3.generate_presigned_url(ClientMethod='get_object',Params={'Bucket': os.environ['BUCKET'],'Key': postId + ".mp3"})
    
    os.remove('/tmp/' + postId)

    response = {
        'statusCode': 200,
        'headers': {
            'content-type': 'application/json', 
            'Access-Control-Allow-Origin': "*",
        },
        'body': preSignedUrl,
        'isBase64Encoded': True
    }

    return response
