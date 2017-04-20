stanza = """


def lambda_handler(event, context):
    marker = chr(34) * 3
    quine = 'stanza = ' + marker + stanza + marker + stanza
    return {'statusCode': '200',
            'body': quine}
"""


def lambda_handler(event, context):
    marker = chr(34) * 3
    quine = 'stanza = ' + marker + stanza + marker + stanza
    return {'statusCode': '200',
            'body': quine}
