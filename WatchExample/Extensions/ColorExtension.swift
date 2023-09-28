//
//  ColorExtension.swift
//  Stokastik
//
//  Created by Burak Yılmaz on 29.08.2023.
//

import SwiftUI

extension Color {
    
    struct Brand {
        static var primary: Color {
            Color("brand/primary")
        }
        static var secondary: Color {
            Color("brand/secondary")
        }
    }
    
    struct Tint {
        static var primary: Color {
            Color("tint/primary")
        }
        
        static var secondary: Color {
            Color("tint/secondary")
        }
        
        static var terniary: Color {
            Color("tint/terniary")
        }
        
        static var red: Color {
            Color("tint/red")
        }
        
        static var white: Color {
            Color("tint/white")
        }
        
        static var yellow: Color {
            Color("tint/yellow")
        }
    }
    
    struct Background {
        static var primary: Color {
            Color("background/primary")
        }
        static var secondary: Color {
            Color("background/secondary")
        }
    }
}

extension Color {
    
    static func convert(_ color: Color) -> UIColor {
        UIColor(color)
    }
}
