
import UIKit

class GCDViewController: UIViewController {
    let buttonView = UIView()
    let syncButton = UIButton()
    let asyncButton = UIButton()
    let serialAsyncButton = UIButton()
    
    let imageUIView = UIView()
    
   
    let firstImageView = UIImageView()
    let secondImageView = UIImageView()
    let thirdmageView = UIImageView()
    
    lazy var imageViewList = [firstImageView, secondImageView, thirdmageView]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetting()
        
        syncButton.addTarget(self, action: #selector(syncButtonAct), for: .touchUpInside)
        
        asyncButton.addTarget(self, action: #selector(showButtonAct), for: .touchUpInside)
        
        serialAsyncButton.addTarget(self , action: #selector(showSerialAsyncAct), for: .touchUpInside)
        
        print("11111")
        print("22222")
        print("33333")
        print("44444")
        
        // serialSync()
        // serialAsync()
        //concurrentSync()
        //concurrentAsync()
    }

}
extension GCDViewController {
    func serialSync() {
        print("내가 바로 시리얼(직렬-> 한개의 쓰레드에 몰빵 ) 싱크 동기 -> 기다릴께")
        DispatchQueue.main.sync {
            print("항상 널 기다리고 있을께")
        }
        print("난 끝이야")
    }
    
    func serialAsync() {
        print("나도 시리얼 (직렬 -> 한개의 쓰레드에 몰빵) 어싱크 기다리지 않아")
        for i in 1...50 {
            DispatchQueue.main.async {
                print(i,"이만큼 일했어")
            }
        }
        print("난 끝이야 -> ")
    }
    
    func concurrentSync() {
        print("내가 바로 콘커런트 -> 분산이야 싱크 -> 기다릴께")
        for i in 1...50 {
            DispatchQueue.global().sync {
                print("난 "+"\(i)"+" 일했어 하지만 언제끝날지 너가 알까? ")
            }
        }
        print("난 끝이야 -> ")
    }
    
    func concurrentAsync() {
        print("내가 바로 콘커런트 -> 분산이야 싱크 -> 기다릴께")
        for i in 1...50 {
            DispatchQueue.global().async {
                print("난 "+"\(i)"+" 일했어 하지만 언제끝날지 너가 알까? ")
            }
        }
        print("난 끝이야 -> ")
    }
}



extension GCDViewController {
    @objc func syncButtonAct(){
        print("🎬sync::1️⃣1️⃣1️⃣1️⃣1️⃣1️⃣🎬")
        for imageView in imageViewList {
            print("sync::2️⃣2️⃣2️⃣2️⃣2️⃣")
            showSyncImages(imageView: imageView)
            print("sync::3️⃣3️⃣3️⃣3️⃣3️⃣")
        }
        print("✂️sync::4️⃣4️⃣4️⃣4️⃣4️⃣✂️")
    }
    
    func showSyncImages(imageView: UIImageView){
        print("싱크시작 👺👺👺👺👺")
        do{
            
            let data = try Data(contentsOf: NasaAssistant.getURL!)
            imageView.image = UIImage(data: data)
           
        } catch {
            print("ERROR🔥🔥🔥🔥🔥🔥")
        }
        print("싱크끝 😸😸😸😸😸")
    }
    
    @objc func showButtonAct() {
        
        print("🎬매인 요청 Async::1️⃣1️⃣1️⃣1️⃣1️⃣1️⃣🎬")
        for imageView in imageViewList {
            print("매인 반복문 Async::2️⃣2️⃣2️⃣2️⃣2️⃣")
            showAsyncImages(imageView: imageView)
            print("매인 반복문끝 Async::3️⃣3️⃣3️⃣3️⃣3️⃣")
        }
        print("✂️매인 요청끝 Async::4️⃣4️⃣4️⃣4️⃣4️⃣44✂️")
    }
    
    func showAsyncImages(imageView: UIImageView) {
        print("어싱크시작 👺👺👺👺👺")
        DispatchQueue.global().async {
            do{
                print("111111111111111")
                guard let url = NasaAssistant.getURL else { return }
                let data = try Data(contentsOf: url)
                print("22222222222222")
                DispatchQueue.main.async {
                    print("Main 으로 다시....")
                    imageView.image = UIImage(data: data)
                    print("이미지 보냈다,...!")
                }
               print("33333333333333")
            } catch {
                print("ERROR🔥🔥🔥🔥🔥🔥")
            }
            
        }
        print("어싱크끝 😸😸😸😸😸")
        
    }
    
    
    @objc func showSerialAsyncAct() {
        print("🎬매인 요청 SerialAsync::1️⃣1️⃣1️⃣1️⃣1️⃣1️⃣🎬")
        for imageView in imageViewList {
            print("매인 반복문 SerialAsync::2️⃣2️⃣2️⃣2️⃣2️⃣")
            showAsyncImages(imageView: imageView)
            print("매인 반복문끝 SerialAsync::3️⃣3️⃣3️⃣3️⃣3️⃣")
        }
        print("✂️매인 요청끝 SerialAsync::4️⃣4️⃣4️⃣4️⃣4️⃣44✂️")
    }
    
    
    
}






extension GCDViewController {
    func defaultSetting() {
        view.backgroundColor = .systemGray6
        view.addSubview(buttonView)
        view.addSubview(imageUIView)
        
        buttonView.addSubview(syncButton)
        buttonView.addSubview(asyncButton)
        buttonView.addSubview(serialAsyncButton)
        
        imageUIView.addSubview(firstImageView)
        imageUIView.addSubview(secondImageView)
        imageUIView.addSubview(thirdmageView)
        
        buttonView.backgroundColor = .systemGray2
        buttonView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 150)
        
        syncButton.frame = CGRect(x: 20, y: buttonView.frame.height - 50, width: UIScreen.main.bounds.width / 3 - 40, height: 40)
        
        asyncButton.frame = CGRect(x: buttonView.frame.width / 3 + 20, y: buttonView.frame.height - 50, width: UIScreen.main.bounds.width / 3 - 40, height: 40)
        let width = asyncButton.frame.width
        serialAsyncButton.frame = CGRect(x: buttonView.frame.width / 3 + width + 60 , y: buttonView.frame.height - 50, width: UIScreen.main.bounds.width / 3 - 40, height: 40)
        
        var config = UIButton.Configuration.filled()
        
        config.baseBackgroundColor = .brown
        config.baseForegroundColor = .white
        config.title = "sirial Async"
        
        serialAsyncButton.configuration = config
        
        
        var syncButtonConfigu = UIButton.Configuration.filled()
        syncButtonConfigu.baseBackgroundColor = .green
        syncButtonConfigu.baseForegroundColor = .black
        syncButtonConfigu.title = "sync"
        
        syncButton.configuration = syncButtonConfigu
        
        
        var asyncButtonConfigu = UIButton.Configuration.filled()
        asyncButtonConfigu.baseBackgroundColor = .red
        asyncButtonConfigu.baseForegroundColor = .white
        asyncButtonConfigu.title = "async"
        asyncButton.configuration = asyncButtonConfigu
        
        
        imageUIView.frame = CGRect(x: 0 , y: buttonView.frame.height , width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - buttonView.frame.height)
        
        firstImageView.frame = CGRect(x: 20, y: 20, width: UIScreen.main.bounds.width - 40, height: imageUIView.frame.height / 3 - 40)
        firstImageView.backgroundColor = .white
        
        secondImageView.frame = CGRect(x: 20, y: firstImageView.frame.height + 40, width: UIScreen.main.bounds.width - 40, height: imageUIView.frame.height / 3 - 40)
        secondImageView.backgroundColor = .red
        
        thirdmageView.frame = CGRect(x: 20, y: firstImageView.frame.height +  secondImageView.frame.height + 60, width: UIScreen.main.bounds.width - 40, height: imageUIView.frame.height / 3 - 40)
        thirdmageView.backgroundColor = .blue
        
        imageUIView.backgroundColor = .brown
        // syncButton.
    }
    
}
