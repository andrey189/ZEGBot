//
//  Types.swift
//  ZEGBot
//
//  Created by Shane Qi on 5/30/16.
//  Copyright © 2016 com.github.shaneqi. All rights reserved.
//
//  Licensed under Apache License v2.0
//

public struct Update {
	
	public var update_id: Int
	
	/* Optional. */
	public var message: Message?
	public var edited_message: Message?
	//	public var inline_query: InlineQuery?
	//	public var chosen_inline_result: ChosenInlineResult?
	//	public var callback_query: CallbackQuery?
	
}

public class Message {
	
	public var message_id: Int
	public var date: Int
	public var chat: Chat
	
	/* Optional. */
	public var from: User?
	public var forward_from: User?
	public var forward_from_chat: Chat?
	public var forward_date: Int?
	public var reply_to_message: Message?
	public var edit_date: Int?
	public var text: String?
	public var entities: [MessageEntity]?
	public var audio: Audio?
	public var document: Document?
	public var photo: [PhotoSize]?
	public var sticker: Sticker?
	public var video: Video?
	public var voice: Voice?
	public var caption: String?
	public var contact: Contact?
	public var location: Location?
	public var venue: Venue?
	public var new_chat_member: User?
	public var left_chat_member: User?
	public var new_chat_title: String?
	public var new_chat_photo: [PhotoSize]?
	public var delete_chat_photo: Bool?
	public var group_chat_created: Bool?
	public var supergroup_chat_created: Bool?
	public var channel_chat_created: Bool?
	public var migrate_to_chat_id: Int?
	public var migrate_from_chat_id: Int?
	public var pinned_message: Message?
	
	public init() {
		self.message_id = 0
		self.date = 0
		self.chat = Chat(id: 9, type: .private, title: nil, username: nil, first_name: nil, last_name: nil)
	}
	
}

public struct Chat {
	
	public var id: Int
	public var type: StructType
	
	/* Optional. */
	public var title: String?
	public var username: String?
	public var first_name: String?
	public var last_name: String?
	
	public enum StructType: String {
		
		public init?(from string: String?) {
			guard let typeString = string else { return nil }
			guard let instance = StructType(rawValue: typeString.lowercased()) else { return nil }
			self = instance
		}
		
		case `private`, group, supergroup, channel
	}
	
}

public struct User {
	
	public var id: Int
	public var first_name: String
	
	/* OPTIONAL. */
	public var last_name: String?
	public var username: String?
	
}

public struct MessageEntity {
	
	public var type: StructType
	public var offset: Int
	public var length: Int
	
	/* OPTIONAl. */
	public var url: String?
	public var user: User?
	
	public enum StructType: String {
		public init?(from string: String?) {
			guard let typeString = string else { return nil }
			guard let instance = StructType(rawValue: typeString.lowercased()) else { return nil }
			self = instance
		}
		
		case mention, hashtag
		case botCommand = "bot_command"
		case url, email, bold, italic, code, pre
		case textLink = "text_link"
		case textMention = "text_mention"
		
	}
	
}

public struct Audio {
	
	public var file_id: String
	public var duration: Int
	
	/* OPTIONAL. */
	public var performer: String?
	public var title: String?
	public var mime_type: String?
	public var file_size: Int?
	
}

public struct Document {
	
	public var file_id: String
	
	/* OPTIONAL. */
	public var thumb: PhotoSize?
	public var file_name: String?
	public var mime_type: String?
	public var file_size: Int?
	
}

public struct PhotoSize {
	
	public var file_id: String
	public var width: Int
	public var height: Int
	
	/* Optional. */
	public var file_size: Int?
	
}

public struct Sticker {
	
	public var file_id: String
	public var width: Int
	public var height: Int
	
	/* Optional. */
	public var thumb: PhotoSize?
	public var emoji: String?
	public var file_size: Int?
	
}

public struct Video {
	
	public var file_id: String
	public var width: Int
	public var height: Int
	public var duration: Int
	
	/* OPTIONAL. */
	public var thumb: PhotoSize?
	public var mime_type: String?
	public var file_size: Int?

}

public struct Voice {
	
	public var file_id: String
	public var duration: Int
	
	/* Optional. */
	public var mime_type: String?
	public var file_size: Int?
	
}

public struct Contact {
	
	public var phone_number: String
	public var first_name: String
	
	/* OPTIONAL. */
	public var last_name: String?
	public var user_id: Int?

}

public struct Location {
	
	public var longitude: Double
	public var latitude: Double

}

public struct Venue {
	
	public var location: Location
	public var title: String
	public var address: String
	
	/* OPTIONAL. */
	public var foursquare_id: String?

}

public struct File {

	public var fileId: String

	/* OPTIONAL. */
	public var fileSize: Int?
	public var filePath: String?

}

public enum ParseMode: String {
	case markdown
	case html
}

public enum ChatAction: String {
	case typing
	case uploadPhoto = "upload_photo"
	case recordVideo = "record_video"
	case uploadVideo = "upload_video"
	case recordAudio = "record_audio"
	case uploadAudio = "upload_audio"
	case uploadDocument = "upload_document"
	case findLocation = "find_location"
}
