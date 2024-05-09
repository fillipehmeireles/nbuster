import httpclient

type ResponseStats* = object
    status*: HttpCode
    chars*: int

proc makeGetRequest*(url: string): ResponseStats = 
    let client: HttpClient = newHttpClient()
    defer: client.close() 
    var response = client.get(url)
    result = ResponseStats(status: response.code, chars: response.body.len)
   
        