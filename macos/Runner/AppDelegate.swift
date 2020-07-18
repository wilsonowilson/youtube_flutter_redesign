import Cocoa
import FlutterMacOS

public extension NSView {
  @objc func originalIsOpaque() -> Bool {
    return true;
  }
  
  @objc func isOpaqueMethodToCall() -> Bool {
    if self.className != "FlutterView" {
      return originalIsOpaque();
    }
    
    let openglView: NSOpenGLView = self as! NSOpenGLView
    var opacity: GLint = 0
    let opacityPointer: UnsafePointer<GLint> = UnsafePointer(&opacity)
    openglView.openGLContext?.setValues(opacityPointer, for: .surfaceOpacity)
    
    return false;
  }
}

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }
    override init() {
       super.init()
       swizzleNSViewOpaqueImplementation();
     }
    @objc func swizzleNSViewOpaqueImplementation() {
      let aClass: AnyClass? = NSClassFromString("FlutterView")
      let originalMethod = class_getInstanceMethod(aClass, Selector("isOpaque"))
      let placeholderMethod = class_getInstanceMethod(aClass, #selector(NSView.originalIsOpaque))
      if let originalMethod = originalMethod, let placeholderMethod = placeholderMethod {
        // save the original implementation
        method_exchangeImplementations(originalMethod, placeholderMethod)
      }
      
      let isOpaqueMethod = class_getInstanceMethod(aClass, Selector("isOpaque"))
      let isOpaqueMethodToCall = class_getInstanceMethod(aClass, #selector(NSView.isOpaqueMethodToCall))
      if let isOpaqueMethod = isOpaqueMethod, let isOpaqueMethodToCall = isOpaqueMethodToCall {
        // switch to the implementation we actually want to call
        method_exchangeImplementations(isOpaqueMethod, isOpaqueMethodToCall)
      }
    }
}

