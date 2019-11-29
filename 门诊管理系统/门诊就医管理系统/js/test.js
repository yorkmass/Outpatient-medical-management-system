$(function(){ 
    var MobileUA = (function() {
        var ua = navigator.userAgent.toLowerCase(); 
        var mua = { 
            IOS: /ipod|iPhone|ipad/.test(ua), //iOS 
            IPHONE: /iphone/.test(ua), //iPhone 
            IPAD: /ipad/.test(ua), //iPad   
            android: /android/.test(ua), //Android Device 
            Windows: /windows/.test(ua), //Windows Device 
            TOUCH_DEVICE: ('ontouchstart' in window) || /touch/.test(ua), //Touch Device  
            MOBILE: /mobile/.test(ua), //Mobile Device (iPad)
            ANDROID_TABLET: false, //Android Tablet      
            WINDOWS_TABLET: false, //Windows Tablet     
            TABLET: false, //Tablet (iPad, Android, Windows)
            SMART_PHONE: false //Smart Phone (iPhone, Android)      
        };                
        mua.ANDROID_TABLET = mua.ANDROID && !mua.MOBILE;      
        mua.WINDOWS_TABLET = mua.WINDOWS && /tablet/.test(ua);    
        mua.TABLET = mua.IPAD || mua.ANDROID_TABLET || mua.WINDOWS_TABLET;    
        mua.SMART_PHONE = mua.MOBILE && !mua.TABLET;      
        return mua;
    }());

    //document.write($(window).height());

    //SmartPhone        
    if (!MobileUA.SMART_PHONE)    
        // 移动端链接地址        
        window.location.href = 'manager/login.html';
    else
        window.location.href = '/default.aspx';

    
});