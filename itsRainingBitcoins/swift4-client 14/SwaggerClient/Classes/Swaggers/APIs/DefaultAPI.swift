//
// DefaultAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class DefaultAPI {
    /**

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func listingDataGet(completion: @escaping ((_ data: ListingDatas?,_ error: Error?) -> Void)) {
        listingDataGetWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /listingData
     - examples: [{contentType=application/json, example=""}]

     - returns: RequestBuilder<ListingDatas> 
     */
    open class func listingDataGetWithRequestBuilder() -> RequestBuilder<ListingDatas> {
        let path = "/listingData"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<ListingDatas>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**

     - parameter listingID: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func listingDataListingIDGet(listingID: String, completion: @escaping ((_ data: ListingData?,_ error: Error?) -> Void)) {
        listingDataListingIDGetWithRequestBuilder(listingID: listingID).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /listingData/{listingID}
     - examples: [{contentType=application/json, example={
  "address" : "address",
  "listingId" : "listingId",
  "descriptionText" : "descriptionText",
  "numBeds" : "numBeds",
  "deviceId" : "deviceId",
  "dateAdded" : "dateAdded",
  "leaseTerms" : "leaseTerms",
  "numBaths" : "numBaths",
  "leaseType" : "leaseType",
  "price" : "price",
  "parkingPolicy" : "parkingPolicy",
  "smokingPolicy" : "smokingPolicy",
  "petPolicy" : "petPolicy",
  "laundryData" : "laundryData"
}}]
     
     - parameter listingID: (path)  

     - returns: RequestBuilder<ListingData> 
     */
    open class func listingDataListingIDGetWithRequestBuilder(listingID: String) -> RequestBuilder<ListingData> {
        var path = "/listingData/{listingID}"
        let listingIDPreEscape = "\(listingID)"
        let listingIDPostEscape = listingIDPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{listingID}", with: listingIDPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<ListingData>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**

     - parameter listingData: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func listingDataPost(listingData: ListingData, completion: @escaping ((_ data: ListingData?,_ error: Error?) -> Void)) {
        listingDataPostWithRequestBuilder(listingData: listingData).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - POST /listingData
     - examples: [{contentType=application/json, example={
  "address" : "address",
  "listingId" : "listingId",
  "descriptionText" : "descriptionText",
  "numBeds" : "numBeds",
  "deviceId" : "deviceId",
  "dateAdded" : "dateAdded",
  "leaseTerms" : "leaseTerms",
  "numBaths" : "numBaths",
  "leaseType" : "leaseType",
  "price" : "price",
  "parkingPolicy" : "parkingPolicy",
  "smokingPolicy" : "smokingPolicy",
  "petPolicy" : "petPolicy",
  "laundryData" : "laundryData"
}}]
     
     - parameter listingData: (body)  

     - returns: RequestBuilder<ListingData> 
     */
    open class func listingDataPostWithRequestBuilder(listingData: ListingData) -> RequestBuilder<ListingData> {
        let path = "/listingData"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: listingData)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<ListingData>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func renterMatchFuncGet(completion: @escaping ((_ data: RenterMatches?,_ error: Error?) -> Void)) {
        renterMatchFuncGetWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /renterMatchFunc
     - examples: [{contentType=application/json, example=""}]

     - returns: RequestBuilder<RenterMatches> 
     */
    open class func renterMatchFuncGetWithRequestBuilder() -> RequestBuilder<RenterMatches> {
        let path = "/renterMatchFunc"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<RenterMatches>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**

     - parameter renterMatch: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func renterMatchFuncPost(renterMatch: RenterMatch, completion: @escaping ((_ data: Empty?,_ error: Error?) -> Void)) {
        renterMatchFuncPostWithRequestBuilder(renterMatch: renterMatch).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - POST /renterMatchFunc
     - examples: [{contentType=application/json, example={ }}]
     
     - parameter renterMatch: (body)  

     - returns: RequestBuilder<Empty> 
     */
    open class func renterMatchFuncPostWithRequestBuilder(renterMatch: RenterMatch) -> RequestBuilder<Empty> {
        let path = "/renterMatchFunc"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: renterMatch)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Empty>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**

     - parameter userData: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func userDataFuncPost(userData: UserData, completion: @escaping ((_ data: UserData?,_ error: Error?) -> Void)) {
        userDataFuncPostWithRequestBuilder(userData: userData).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - POST /userDataFunc
     - examples: [{contentType=application/json, example={
  "birthday" : "birthday",
  "felon" : "felon",
  "occupation" : "occupation",
  "education" : "education",
  "city" : "city",
  "photoId" : "photoId",
  "deviceId" : "deviceId",
  "listings" : "listings",
  "smoker" : "smoker",
  "drinker" : "drinker",
  "name" : "name",
  "company" : "company",
  "dependents" : "dependents",
  "userType" : "userType",
  "priceRange" : "priceRange",
  "maritalStatus" : "maritalStatus"
}}]
     
     - parameter userData: (body)  

     - returns: RequestBuilder<UserData> 
     */
    open class func userDataFuncPostWithRequestBuilder(userData: UserData) -> RequestBuilder<UserData> {
        let path = "/userDataFunc"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: userData)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<UserData>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**

     - parameter userID: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func userDataFuncUserIDGet(userID: String, completion: @escaping ((_ data: UserData?,_ error: Error?) -> Void)) {
        userDataFuncUserIDGetWithRequestBuilder(userID: userID).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /userDataFunc/{userID}
     - examples: [{contentType=application/json, example={
  "birthday" : "birthday",
  "felon" : "felon",
  "occupation" : "occupation",
  "education" : "education",
  "city" : "city",
  "photoId" : "photoId",
  "deviceId" : "deviceId",
  "listings" : "listings",
  "smoker" : "smoker",
  "drinker" : "drinker",
  "name" : "name",
  "company" : "company",
  "dependents" : "dependents",
  "userType" : "userType",
  "priceRange" : "priceRange",
  "maritalStatus" : "maritalStatus"
}}]
     
     - parameter userID: (path)  

     - returns: RequestBuilder<UserData> 
     */
    open class func userDataFuncUserIDGetWithRequestBuilder(userID: String) -> RequestBuilder<UserData> {
        var path = "/userDataFunc/{userID}"
        let userIDPreEscape = "\(userID)"
        let userIDPostEscape = userIDPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{userID}", with: userIDPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<UserData>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**

     - parameter appid: (query)  (optional)
     - parameter q: (query)  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func weatherdata1Get(appid: String? = nil, q: String? = nil, completion: @escaping ((_ data: Weather?,_ error: Error?) -> Void)) {
        weatherdata1GetWithRequestBuilder(appid: appid, q: q).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /weatherdata1
     - examples: [{contentType=application/json, example={ }}]
     
     - parameter appid: (query)  (optional)
     - parameter q: (query)  (optional)

     - returns: RequestBuilder<Weather> 
     */
    open class func weatherdata1GetWithRequestBuilder(appid: String? = nil, q: String? = nil) -> RequestBuilder<Weather> {
        let path = "/weatherdata1"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "appid": appid, 
            "q": q
        ])

        let requestBuilder: RequestBuilder<Weather>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**

     - parameter appid: (query)  (optional)
     - parameter q: (query)  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func weatherdataGet(appid: String? = nil, q: String? = nil, completion: @escaping ((_ data: Weather?,_ error: Error?) -> Void)) {
        weatherdataGetWithRequestBuilder(appid: appid, q: q).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /weatherdata
     - examples: [{contentType=application/json, example={ }}]
     
     - parameter appid: (query)  (optional)
     - parameter q: (query)  (optional)

     - returns: RequestBuilder<Weather> 
     */
    open class func weatherdataGetWithRequestBuilder(appid: String? = nil, q: String? = nil) -> RequestBuilder<Weather> {
        let path = "/weatherdata"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "appid": appid, 
            "q": q
        ])

        let requestBuilder: RequestBuilder<Weather>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func weatherlogoGet(completion: @escaping ((_ data: Empty?,_ error: Error?) -> Void)) {
        weatherlogoGetWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /weatherlogo
     - examples: [{contentType=application/json, example={ }}]

     - returns: RequestBuilder<Empty> 
     */
    open class func weatherlogoGetWithRequestBuilder() -> RequestBuilder<Empty> {
        let path = "/weatherlogo"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Empty>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
