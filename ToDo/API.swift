// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class ToDoListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ToDoList {
      reminders {
        __typename
        id
        title
        description
        status
      }
    }
    """

  public let operationName: String = "ToDoList"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("reminders", type: .list(.object(Reminder.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(reminders: [Reminder?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "reminders": reminders.flatMap { (value: [Reminder?]) -> [ResultMap?] in value.map { (value: Reminder?) -> ResultMap? in value.flatMap { (value: Reminder) -> ResultMap in value.resultMap } } }])
    }

    public var reminders: [Reminder?]? {
      get {
        return (resultMap["reminders"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Reminder?] in value.map { (value: ResultMap?) -> Reminder? in value.flatMap { (value: ResultMap) -> Reminder in Reminder(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Reminder?]) -> [ResultMap?] in value.map { (value: Reminder?) -> ResultMap? in value.flatMap { (value: Reminder) -> ResultMap in value.resultMap } } }, forKey: "reminders")
      }
    }

    public struct Reminder: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Reminder"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("status", type: .nonNull(.scalar(Bool.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, title: String, description: String? = nil, status: Bool) {
        self.init(unsafeResultMap: ["__typename": "Reminder", "id": id, "title": title, "description": description, "status": status])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var status: Bool {
        get {
          return resultMap["status"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }
    }
  }
}

public final class CreateToDoMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation createToDo($title: String!, $description: String) {
      post(title: $title, description: $description) {
        __typename
        id
        title
        description
        status
      }
    }
    """

  public let operationName: String = "createToDo"

  public var title: String
  public var description: String?

  public init(title: String, description: String? = nil) {
    self.title = title
    self.description = description
  }

  public var variables: GraphQLMap? {
    return ["title": title, "description": description]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("post", arguments: ["title": GraphQLVariable("title"), "description": GraphQLVariable("description")], type: .nonNull(.object(Post.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(post: Post) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "post": post.resultMap])
    }

    public var post: Post {
      get {
        return Post(unsafeResultMap: resultMap["post"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "post")
      }
    }

    public struct Post: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Reminder"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("status", type: .nonNull(.scalar(Bool.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, title: String, description: String? = nil, status: Bool) {
        self.init(unsafeResultMap: ["__typename": "Reminder", "id": id, "title": title, "description": description, "status": status])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var status: Bool {
        get {
          return resultMap["status"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }
    }
  }
}

public final class UpdateMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation update($id: Int!, $status: Boolean) {
      updateStatus(id: $id, status: $status) {
        __typename
        id
        status
      }
    }
    """

  public let operationName: String = "update"

  public var id: Int
  public var status: Bool?

  public init(id: Int, status: Bool? = nil) {
    self.id = id
    self.status = status
  }

  public var variables: GraphQLMap? {
    return ["id": id, "status": status]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateStatus", arguments: ["id": GraphQLVariable("id"), "status": GraphQLVariable("status")], type: .nonNull(.object(UpdateStatus.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateStatus: UpdateStatus) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateStatus": updateStatus.resultMap])
    }

    public var updateStatus: UpdateStatus {
      get {
        return UpdateStatus(unsafeResultMap: resultMap["updateStatus"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "updateStatus")
      }
    }

    public struct UpdateStatus: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Reminder"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("status", type: .nonNull(.scalar(Bool.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, status: Bool) {
        self.init(unsafeResultMap: ["__typename": "Reminder", "id": id, "status": status])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var status: Bool {
        get {
          return resultMap["status"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }
    }
  }
}
