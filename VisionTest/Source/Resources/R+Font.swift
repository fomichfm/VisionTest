//
//  R+Font.swift
//  VisionTest
//
//  Created by Nikita Fomichev on 02.11.2021.
//

import UIKit

extension R {

    enum Font {

        static func thin(_ size: CGFloat) -> UIFont {
            UIFont.systemFont(ofSize: size, weight: .thin)
        }

        static func light(_ size: CGFloat) -> UIFont {
            UIFont.systemFont(ofSize: size, weight: .light)
        }

        static func regular(_ size: CGFloat) -> UIFont {
            UIFont.systemFont(ofSize: size, weight: .regular)
        }

        static func medium(_ size: CGFloat) -> UIFont {
            UIFont.systemFont(ofSize: size, weight: .medium)
        }

        static func semibold(_ size: CGFloat) -> UIFont {
            UIFont.systemFont(ofSize: size, weight: .semibold)
        }

        static func heavy(_ size: CGFloat) -> UIFont {
            UIFont.systemFont(ofSize: size, weight: .heavy)
        }

        static func bold(_ size: CGFloat) -> UIFont {
            UIFont.systemFont(ofSize: size, weight: .bold)
        }
    }
    
}
