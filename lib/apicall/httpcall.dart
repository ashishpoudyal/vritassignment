// import 'dart:convert';
// import 'package:http/http.dart' as http;

// void createRebrandlyLink() async {
//   // Replace YOUR_API_KEY and YOUR_WORKSPACE_ID with your actual values
//   String apiKey = 'YOUR_API_KEY';
//   String workspaceId = 'YOUR_WORKSPACE_ID';

//   // Rebrandly API endpoint
//   String apiUrl = 'https://api.rebrandly.com/v1/links';

//   // Destination URL and domain information
//   String destinationUrl = 'https://www.youtube.com/channel/UCHK4HD0ltu1-I212icLPt3g';
//   String domainFullName = 'rebrand.ly';

//   // Create headers
//   Map<String, String> headers = {
//     'Content-Type': 'application/json',
//     'apikey': apiKey,
//     'workspace': workspaceId,
//   };

//   // Create request body
//   Map<String, dynamic> requestBody = {
//     'destination': destinationUrl,
//     'domain': {'fullName': domainFullName},
//   };

//   // Convert request body to JSON
//   String requestBodyJson = json.encode(requestBody);

//   try {
//     // Make HTTP POST request
//     var response = await http.post(
//       Uri.parse(apiUrl),
//       headers: headers,
//       body: requestBodyJson,
//     );

//     // Check if the request was successful (status code 2xx)
//     if (response.statusCode >= 200 && response.statusCode < 300) {
//       // Parse and print the response body
//       Map<String, dynamic> responseData = json.decode(response.body);
//       print('Rebrandly link created successfully:');
//       print(responseData);
//     } else {
//       // Print an error message if the request was not successful
//       print('Error creating Rebrandly link. Status code: ${response.statusCode}');
//       print('Response body: ${response.body}');
//     }
//   } catch (e) {
//     // Handle any exceptions that may occur during the request
//     print('Error creating Rebrandly link: $e');
//   }
// }

// void main() {
//   createRebrandlyLink();
// }
