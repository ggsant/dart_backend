![Dart Backend](https://user-images.githubusercontent.com/61892998/178152745-a07e44af-585b-4a9b-939a-439773836257.png)
 
# Shelf

Shelf, is a Web Server Middleware, not a full blown server framework like Django, it is modular, and you add add-ons for the functionalities you need. This modular structure gives the community an easy way to expand the project.

Shelf, is maintained by the Dart team itself but still lacks functionalities, again because is not a server framework. If we want Shelf to compete with other server frameworks, such as Django (Python) it is necessary quite a bit of work. However, at the current status, we can create a web server that suits our needs.

These are the official add-ons maintained by the Dart team:

Shelf (core)
Shelf Router
Shelf Router Generator
Shelf Static
Shelf WebSocket
Shelf CORS Headers

# Starting a backend Project

run:
    
    dart create server

## Packages

| Package | Description | Version |
|---|---|---|
| [shelf](pkgs/shelf/) | A model for web server middleware that encourages composition and easy reuse. | [![pub package](https://img.shields.io/pub/v/shelf.svg)](https://pub.dev/packages/shelf) |
| [shelf_packages_handler](pkgs/shelf_packages_handler/) | A shelf handler for serving a `packages/` directory. | [![pub package](https://img.shields.io/pub/v/shelf_packages_handler.svg)](https://pub.dev/packages/shelf_packages_handler) |
| [shelf_proxy](pkgs/shelf_proxy/) | A shelf handler for proxying HTTP requests to another server. | [![pub package](https://img.shields.io/pub/v/shelf_proxy.svg)](https://pub.dev/packages/shelf_proxy) |
| [shelf_router](pkgs/shelf_router/) | A convinent request router for the shelf web-framework, with support for URL-parameters, nested routers and routers generated from source annotations. | [![pub package](https://img.shields.io/pub/v/shelf_router.svg)](https://pub.dev/packages/shelf_router) |
| [shelf_router_generator](pkgs/shelf_router_generator/) | A package:build compatible builder for generating request routers for the shelf web-framework based on source annotations. | [![pub package](https://img.shields.io/pub/v/shelf_router_generator.svg)](https://pub.dev/packages/shelf_router_generator) |
| [shelf_static](pkgs/shelf_static/) | Static file server support for the shelf package and ecosystem. | [![pub package](https://img.shields.io/pub/v/shelf_static.svg)](https://pub.dev/packages/shelf_static) |
| [shelf_test_handler](pkgs/shelf_test_handler/) | A Shelf handler that makes it easy to test HTTP interactions. | [![pub package](https://img.shields.io/pub/v/shelf_test_handler.svg)](https://pub.dev/packages/shelf_test_handler) |
| [shelf_web_socket](pkgs/shelf_web_socket/) | A shelf handler that wires up a listener for every connection. | [![pub package](https://img.shields.io/pub/v/shelf_web_socket.svg)](https://pub.dev/packages/shelf_web_socket) |

# API Design Best Practices:
Armed with an understanding of your use cases, you’re ready to begin your API design. Each project is different, so best practices may not always fit your situation.

In general, an effective API design will have the following characteristics:

Easy to read and work with
Hard to misuse
Complete and concise
Below are the 8 best practices you should consider when preparing the REST API.

1. Provide API Documentation:
Documentation is important. Always provide documentation for an API.

2. Keep base URLs simple:
The base URL should consist of plural nouns and verbs should be avoided.

3. Accept and respond with JSON:
JSON is the standard for transferring data. REST APIs should accept JSON for request payload and also send responses to JSON.

4. Simplify Associations:
Resource objects often have some kind of functional hierarchy or are related to each other. Eg: GET api/users/1/assets This URL will return all assets of that specific building and you could create assets for that building using POST api/users/1/assets.

4. Complexities Under the Query String:
Query string flags can be used for resource expansion when you know in advance that you are going to need the extra information about the related resources and you aim to reduce API requests for performance. In this case, you can optionally specify which relationships to expand in the query string. Eg. api/users?expand=assets

5. Error Handling with HTTP Status Codes and Messages:
Nobody likes to see the errors in a response that they’ve made to your API. But if they do, it’s good to provide them with enough information to know what has happened and possibly why. So, in API development, correct error handling should be considered as one of the best practices as the sooner a problem is detected, the faster, cheaper, and easier it is to fix it.

Standard HTTP error code handling is a must. There are 71 distinct error codes so why not use them?

Eg. { “status”: 400, code: 21, message: “name field is not specified”}

5. Versioning:
Software applications are never finished, they are constantly evolving and whenever breaking changes in your API are inevitable you need to introduce a new version. Versioning your REST API is a good approach to take right from the start. Versioning is usually done with /v1/, /v2/, etc. added at the start of the API path.

6. Attribute Names in camelCase:
If you are using JSON it makes sense to follow JavaScript’s naming conventions especially if the consumer applications are likely to be written in javascript too. snake_case is easy to read but try to avoid it.

7. Cache data to improve performance:
The good thing about caching is that users can get data faster. We can add caching to return data from the local memory cache instead of querying the database to get the data every time we want to retrieve some data that users request.

8. Always Use HTTPS/SSL/TLS and Maintain Good Security Practices:
No exceptions here. HTTPS matters. All communications should be secured by default and always use SSL/TLS to encrypt the communication with your API.

# A Complete Guide and List of HTTP Status Codes

While there are over 40 different server status codes, you’ll likely encounter fewer than a dozen on a regular basis. Below, we’ve covered the more common ones, as well as a few of the more obscure codes you may still run across.

# 100 Status Codes
A 100-level status code tells you that the request you’ve made to the server is still in progress for some reason. This isn’t necessarily a problem, it’s just extra information to let you know what’s going on.

100: “Continue.” This means that the server in question has received your browser’s request headers, and is now ready for the request body to be sent as well. This makes the request process more efficient since it prevents the browser from sending a body request even though the headers have been rejected.

101: “Switching protocols.” Your browser has asked the server to change protocols, and the server has complied.

103: “Early hints.” This returns some response headers before the rest of the server’s response is ready.

# 200 Status Codes
This is the best kind of HTTP status code to receive. A 200-level response means that everything is working exactly as it should.

200: “Everything is OK.” This is the code that is delivered when a web page or resource acts exactly the way it’s expected to.

201: “Created.” The server has fulfilled the browser’s request, and as a result, has created a new resource.

202: “Accepted.” The server has accepted your browser’s request but is still processing it. The request ultimately may or may not result in a completed response.

203: “Non-Authoritative Information.” This status code may appear when a proxy is in use. It means that the proxy server received a 200 “Everything is OK” status code from the origin server, but has modified the response before passing it on to your browser.

204: “No Content.” This code means that the server has successfully processed the request, but is not going to return any content.

205: “Reset Content.” Like a 204 code, this means that how server has processed the request but is not going to return any content. However, it also requires that your browser resets the document view.

206: “Partial Content.” You may see this status code if your HTTP client (also known as your browser) uses ‘range headers’. This enables your browser to resume paused downloads, as well as to split a download into multiple streams. A 206 code is sent when a range header causes the server to send only part of the requested resource.

# 300 Status Codes
Redirection is the process used to communicate that a resource has been moved to a new location. There are several HTTP status codes that accompany redirections, in order to provide visitors with information about where to find the content they’re looking for.

300: “Multiple Choices.” Sometimes, there may be multiple possible resources the server can respond with to fulfill your browser’s request. A 300 status code means that your browser now needs to choose between them. This may occur when there are multiple file type extensions available, or if the server is experiencing word sense disambiguation.

301: “The requested resource has been moved permanently.” This code is delivered when a web page or resource has been permanently replaced with a different resource. It is used for permanent URL redirection.

302: “The requested resource has moved, but was found.” This code is used to indicate that the requested resource was found, just not at the location where it was expected. It is used for temporary URL redirection.

303: “See Other.” Understanding a 303 status code requires that you know the difference between the four primary HTTP request methods. Essentially, a 303 code tells your browser that it found the resource your browser requested via POST, PUT, or DELETE. However, to retrieve it using GET, you need to make the appropriate request to a different URL than the one you previously used.

304: “The requested resource has not been modified since the last time you accessed it.” This code tells the browser that the resources stored in the browser cache haven’t changed. It’s used to speed up web page delivery by reusing previously-downloaded resources.

307: “Temporary Redirect.” This status code has replaced 302 “Found” as the appropriate action when a resource has been temporarily moved to a different URL. Unlike the 302 status code, it does not allow the HTTP method to change.

308: “Permanent Redirect.” The 308 status code is the successor to the 301 “Moved Permanently” code. It does not allow the HTTP method to change and indicates that the requested resource is now permanently located at a new URL.

# 400 Status Codes
At the 400 level, HTTP status codes start to become problematic. These are error codes specifying that there’s a fault with your browser and/or request.

400: “Bad Request.” The server can’t return a response due to an error on the client’s end. See our guide for resolving this error.

401: “Unauthorized” or “Authorization Required.” This is returned by the server when the target resource lacks valid authentication credentials. You might see this if you’ve set up basic HTTP authentication using htpasswd.

402: “Payment Required.” Originally, this code was created for use as part of a digital cash system. However, that plan never followed through. Instead, it’s used by a variety of platforms to indicate that a request cannot be fulfilled, usually due to a lack of required funds. Common instances include:
You’ve reached your daily request limit to the Google Developers API.
You haven’t paid your Shopify fees and your store has been temporarily deactivated.
Your payment via Stripe has failed, or Stripe is trying to prevent a fraudulent payment.

403: “Access to that resource is forbidden.” This code is returned when a user attempts to access something that they don’t have permission to view. For example, trying to reach password-protected content without logging in might produce a 403 error.

404: “The requested resource was not found.” This is the most common error message of them all. This code means that the requested resource does not exist, and the server does not know if it ever existed.

405: “Method not allowed.” This is generated when the hosting server (origin server) supports the method received, but the target resource doesn’t.
406: “Not acceptable response.” The requested resource is capable of generating only content that is not acceptable according to the accept headers sent in the request.
407: “Proxy Authentication Required.” A proxy server is in use and requires your browser to authenticate itself before continuing.

408: “The server timed out waiting for the rest of the request from the browser.” This code is generated when a server times out while waiting for the complete request from the browser. In other words, the server didn’t get the full request that was sent by the browser. One possible cause could be net congestion resulting in the loss of data packets between the browser and the server.

409: “Conflict.” A 409 status code means that the server couldn’t process your browser’s request because there’s a conflict with the relevant resource. This sometimes occurs due to multiple simultaneous edits.

410: “The requested resource is gone and won’t be coming back.” This is similar to a 404 “Not Found” code, except a 410 indicates that the condition is expected and permanent.

411: “Length Required.” This means that the requested resource requires that the client specify a certain length and that it did not.

412: “Precondition Failed.” Your browser included certain conditions in its request headers, and the server did not meet those specifications.

413: “Payload Too Large” or “Request Entity Too Large.” Your request is larger than the server is willing or able to process.

414: “URI Too Long.” This is usually the result of a GET request that has been encoded as a query string that is too large for the server to process.

415: “Unsupported Media Type.” The request includes a media type that the server or resource doesn’t support.

416: “Range Not Satisfiable.” Your request was for a portion of a resource that the server is unable to return.

417: “Expectation Failed.” The server is unable to meet the requirements specified in the request’s expect header field.

418: “I’m a teapot.” This code is returned by teapots that receive requests to brew coffee. It’s also an April Fool’s Joke from 1998.

422: “Unprocessable Entity.” The client request contains semantic errors, and the server can’t process it.

425: “Too Early.” This code is sent when the server is unwilling to process a request because it may be replayed.

426: “Upgrade Required.” Due to the contents of the request’s upgrade header field, the client should switch to a different protocol.

428: “Precondition Required.” The server requires conditions to be specified before processing the request.

429: “Too many requests.” This is generated by the server when the user has sent too many requests in a given amount of time (rate-limiting). This can sometimes occur due to bots or scripts attempting to access your site. In this case, you might want to try changing your WordPress login URL. You can also check out our guide to fixing a 429 “Too Many Requests” error.

431: “Request Header Fields Too Large.” The server can’t process the request because the header fields are too large. This may indicate a problem with a single header field, or all of them collectively.

451: “Unavailable for Legal Reasons.” The operator of the server has received a demand to prohibit access to the resource you’ve requested (or a set of resources including the one you’ve requested). Fun fact: This code is a reference to Ray Bradbury’s novel Fahrenheit 451.

499: “Client closed request.” This is returned by NGINX when the client closes the request while Nginx is still processing it.

# 500 Status Codes
500-level status codes are also considered errors. However, they denote that the problem is on the server’s end. This can make them more difficult to resolve.

500: “There was an error on the server and the request could not be completed.” This is generic code that simply means “internal server error”. Something went wrong on the server and the requested resource was not delivered. This code is typically generated by third-party plugins, faulty PHP, or even the connection to the database breaking. Check out our tutorials on how to fix the error establishing a database connection and other ways to resolve a 500 internal server error.

501: “Not Implemented.” This error indicates that the server does not support the functionality required to fulfill the request. This is almost always a problem on the web server itself, and usually must be resolved by the host. Check out our recommendations on how to resolve a 501 not implemented error.

502: “Bad Gateway.” This error code typically means that one server has received an invalid response from another, such as when a proxy server is in use. Other times a query or request will take too long, and so it is canceled or killed by the server and the connection to the database breaks. For more details, see our in-depth tutorial on how to fix the 502 Bad Gateway error.

503: “The server is unavailable to handle this request right now.” The request cannot be completed at this point in time. This code may be returned by an overloaded server that is unable to handle additional requests. We have a full guide on how to fix the 503 Service Unavailable Error.

504: “The server, acting as a gateway, timed out waiting for another server to respond.” This is the code returned when there are two servers involved in processing a request, and the first server times out waiting for the second server to respond. You can read more about how to fix 504 errors in our dedicated guide.

505: “HTTP Version Not Supported.” The server doesn’t support the HTTP version the client used to make the request.

508: “Resource Limit Is Reached” limits on resources set by your web host have been reached. Check out our tutorial on how to resolve “508 Resource Limit Is Reached” error.

509: “Bandwidth Limit Exceeded” means your website is using more bandwidth than your hosting provider allows.

511: “Network Authentication Required.” This status code is sent when the network you’re trying to use requires some form of authentication before sending your request to the server. For instance, you may need to agree to the Terms and Conditions of a public Wi-Fi hotspot.

521: “Web server is down.” Error 521 is a Cloudflare-specific error message. It means that your web browser was able to successfully connect to Cloudflare, but Cloudflare was not able to connect to the origin web server.

525: “SSL Handshake Failed“. Error 525 means that the SSL handshake between a domain using Cloudflare and the origin web server failed. If you are experiencing issues there are five methods you can try to easily fix error 525.
