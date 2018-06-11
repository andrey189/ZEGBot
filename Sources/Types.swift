//
//  Types.swift
//  ZEGBot
//
//  Created by Shane Qi on 5/30/16.
//  Copyright © 2016 com.github.shaneqi. All rights reserved.
//
//  Licensed under Apache License v2.0
//

public struct Update: Codable {

	public var updateId: Int

	/* Optional. */
	public var message: Message?
	public var editedMessage: Message?
	public var channelPost: Message?
    public var callbackQuery: CallbackQuery?

	enum CodingKeys: String, CodingKey {
		case message
		case updateId = "update_id"
		case editedMessage = "edited_message"
		case channelPost = "channel_post"
        case callbackQuery = "callback_query"
	}
}

public struct CallbackQuery: Codable {
    public var id: String
    public var from: User
    public var chatInstance: String
    
    /* Optional. */
    public var message: Message?
    public var inlineMessageId: String?
    public var data: String?
    public var gameShortName: String?
    
    enum CodingKeys: String, CodingKey {
        case id, from, message, data
        case chatInstance = "chat_instance"
        case inlineMessageId = "inline_message_id"
        case gameShortName = "game_short_name"
    }
}

public class Message: Codable {

	public var messageId: Int = -1
	public var date: Int = -1
	public var chat: Chat? = nil

	/* Optional. */
	public var from: User?  = nil
	public var forwardFrom: User? = nil
	public var forwardFromChat: Chat? = nil
	public var forwardDate: Int? = nil
	public var replyToMessage: Message? = nil
	public var editDate: Int? = nil
	public var text: String? = nil
	public var entities: [MessageEntity]? = nil
	public var audio: Audio? = nil
	public var document: Document? = nil
	public var photo: [PhotoSize]? = nil
	public var sticker: Sticker? = nil
	public var video: Video? = nil
	public var voice: Voice? = nil
	public var caption: String? = nil
	public var contact: Contact? = nil
	public var location: Location? = nil
	public var venue: Venue? = nil
	public var newChatMember: User? = nil
	public var leftChatMember: User? = nil
	public var newChatTitle: String? = nil
	public var newChatPhoto: [PhotoSize]? = nil
	public var deleteChatPhoto: Bool? = nil
	public var groupChatCreated: Bool? = nil
	public var supergroupChatCreated: Bool? = nil
	public var channelChatCreated: Bool? = nil
	public var migrateToChatId: Int? = nil
	public var migrateFromChatId: Int? = nil
	public var pinnedMessage: Message? = nil

	enum CodingKeys: String, CodingKey {
		case date, chat, from, text, entities, audio, document, photo, sticker, video, voice, caption, contact, location, venue
		case messageId = "message_id"
		case forwardFrom = "forward_from"
		case forwardFromChat = "forward_from_chat"
		case forwardDate = "forward_date"
		case replyToMessage = "reply_to_message"
		case editDate = "edit_date"
		case newChatMember = "new_chat_member"
		case leftChatMember = "left_chat_member"
		case newChatTitle = "new_chat_title"
		case newChatPhoto = "new_chat_photo"
		case deleteChatPhoto = "delete_chat_photo"
		case groupChatCreated = "group_chat_created"
		case supergroupChatCreated = "supergroup_chat_created"
		case channelChatCreated = "channel_chat_created"
		case migrateToChatId = "migrate_to_chat_id"
		case migrateFromChatId = "migrate_from_chat_id"
		case pinnedMessage = "pinned_message"
	}

}

public struct Chat: Codable {

	public var id: Int
	public var type: StructType

	/* Optional. */
	public var title: String?
	public var username: String?
	public var firstName: String?
	public var lastName: String?

	public enum StructType: String, Codable {
		case `private`, group, supergroup, channel
	}

	enum CodingKeys: String, CodingKey {
		case id, type, title, username
		case firstName = "first_name"
		case lastName = "last_name"
	}

}

public struct User: Codable {

	public var id: Int
	public var firstName: String

	/* OPTIONAL. */
	public var lastName: String?
	public var username: String?

	enum CodingKeys: String, CodingKey {
		case id, username
		case firstName = "first_name"
		case lastName = "last_name"
	}

}

public struct MessageEntity: Codable {

	public var type: StructType
	public var offset: Int
	public var length: Int

	/* OPTIONAl. */
	public var url: String?
	public var user: User?

	public enum StructType: String, Codable {
		case mention, hashtag, url, email, bold, italic, code, pre
		case botCommand = "bot_command"
		case textLink = "text_link"
		case textMention = "text_mention"
	}

}

public struct Audio: Codable {

	public var fileId: String
	public var duration: Int

	/* OPTIONAL. */
	public var performer: String?
	public var title: String?
	public var mimeType: String?
	public var fileSize: Int?

	enum CodingKeys: String, CodingKey {
		case duration, performer, title
		case fileId = "file_id"
		case mimeType = "mime_type"
		case fileSize = "file_size"
	}

}

public struct Document: Codable {

	public var fileId: String

	/* OPTIONAL. */
	public var thumb: PhotoSize?
	public var fileName: String?
	public var mimeType: String?
	public var fileSize: Int?

	enum CodingKeys: String, CodingKey {
		case thumb
		case fileId = "file_id"
		case fileName = "file_name"
		case mimeType = "mime_type"
		case fileSize = "file_size"
	}

}

public struct PhotoSize: Codable {

	public var fileId: String
	public var width: Int
	public var height: Int

	/* Optional. */
	public var fileSize: Int?

	enum CodingKeys: String, CodingKey {
		case width, height
		case fileId = "file_id"
		case fileSize = "file_size"
	}

}

public struct Sticker: Codable {

	public var fileId: String
	public var width: Int
	public var height: Int

	/* Optional. */
	public var thumb: PhotoSize?
	public var emoji: String?
	public var fileSize: Int?

	enum CodingKeys: String, CodingKey {
		case width, height, thumb, emoji
		case fileId = "file_id"
		case fileSize = "file_size"
	}

}

public struct Video: Codable {

	public var fileId: String
	public var width: Int
	public var height: Int
	public var duration: Int

	/* OPTIONAL. */
	public var thumb: PhotoSize?
	public var mimeType: String?
	public var fileSize: Int?

	enum CodingKeys: String, CodingKey {
		case width, height, duration, thumb
		case fileId = "file_id"
		case mimeType = "mime_type"
		case fileSize = "file_size"
	}

}

public struct Voice: Codable {

	public var fileId: String
	public var duration: Int

	/* Optional. */
	public var mimeType: String?
	public var fileSize: Int?

	enum CodingKeys: String, CodingKey {
		case duration
		case fileId = "file_id"
		case mimeType = "mime_type"
		case fileSize = "file_size"
	}

}

public struct Contact: Codable {

	public var phoneNumber: String
	public var firstName: String

	/* OPTIONAL. */
	public var lastName: String?
	public var userId: Int?

	enum CodingKeys: String, CodingKey {
		case phoneNumber = "phone_number"
		case firstName = "first_name"
		case lastName = "last_name"
		case userId = "user_id"
	}

}

public struct Location: Codable {

	public var longitude: Double
	public var latitude: Double

}

public struct Venue: Codable {

	public var location: Location
	public var title: String
	public var address: String

	/* OPTIONAL. */
	public var foursquareId: String?

	enum CodingKeys: String, CodingKey {
		case location, title, address
		case foursquareId = "foursquare_id"
	}

}

public struct File: Codable {

	public var fileId: String

	/* OPTIONAL. */
	public var fileSize: Int?
	public var filePath: String?

	enum CodingKeys: String, CodingKey {
		case fileSize = "file_size"
		case fileId = "file_id"
		case filePath = "file_path"
	}

}

public enum ParseMode: String, Codable {
	case markdown
	case html
}

public enum ChatAction: String, Codable {
	case typing
	case uploadPhoto = "upload_photo"
	case recordVideo = "record_video"
	case uploadVideo = "upload_video"
	case recordAudio = "record_audio"
	case uploadAudio = "upload_audio"
	case uploadDocument = "upload_document"
	case findLocation = "find_location"
}

public struct InlineKeyboardButton: Codable {
    public var text: String
    /* OPTIONAL. */
    public var url: String?
    public var callbackData:String?
    public var switchInlineQuery:String?
    public var switchInlineQueryCurrentChat:String?
    public var pay:Bool?
    
    public init(text:String, callback: String) {
        self.text = text
        self.callbackData = callback
    }
    
    public init(text:String, url: String) {
        self.text = text
        self.url = url
    }
    
    enum CodingKeys: String, CodingKey {
        case text, url, pay
        case callbackData = "callback_data"
        case switchInlineQuery = "switch_inline_query"
        case switchInlineQueryCurrentChat = "switch_inline_query_current_chat"
    }
}

public protocol KeyboardMarkup : Codable {
    
}

public struct ReplyKeyboardMarkup : KeyboardMarkup {
    public var keyboard: Array<Array<String>>
    /* OPTIONAL. */
    public var resizeKeyboard: Bool?
    public var oneTimeKeyboard: Bool?
    public var selective: Bool?
    
    public init(keyboard:Array<Array<String>>) {
        self.keyboard = keyboard
    }
    
    public init(autoresized keyboard:Array<Array<String>>) {
        self.keyboard = keyboard
        self.resizeKeyboard = true
    }
    
    enum CodingKeys: String, CodingKey {
        case keyboard, selective
        case resizeKeyboard = "resize_keyboard"
        case oneTimeKeyboard = "one_time_keyboard"
    }
}

public struct InlineKeyboardMarkup : KeyboardMarkup {
    public init(inlineKeyboard:Array<Array<InlineKeyboardButton>>) {
        self.inlineKeyboard = inlineKeyboard
    }
    
    public var inlineKeyboard: Array<Array<InlineKeyboardButton>>
    
    enum CodingKeys: String, CodingKey {
        case inlineKeyboard = "inline_keyboard"
    }
}
