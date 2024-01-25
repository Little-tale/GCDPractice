
import UIKit

class GCDViewController: UIViewController {
    let buttonView = UIView()
    let syncButton = UIButton()
    let asyncButton = UIButton()
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
        
    }

}




extension GCDViewController {
    @objc func syncButtonAct(){
        print("sync::1️⃣1️⃣1️⃣1️⃣1️⃣1️⃣")
        for imageView in imageViewList {
            print("sync::2️⃣2️⃣2️⃣2️⃣2️⃣")
            showSyncImages(imageView: imageView)
            print("sync::3️⃣3️⃣3️⃣3️⃣3️⃣")
        }
        print("✂️sync::4️⃣4️⃣4️⃣4️⃣4️⃣✂️")
    }
    
    func showSyncImages(imageView: UIImageView){
        do{
            print("싱크시작 👺👺👺👺👺")
            let data = try Data(contentsOf: NasaAssistant.getURL!)
            imageView.image = UIImage(data: data)
            print("싱크끝 😸😸😸😸😸")
        } catch {
            print("ERROR🔥🔥🔥🔥🔥🔥")
        }
        
    }
    
    @objc func showButtonAct() {
        
        print("🎬매인스택 요청 Async::1️⃣1️⃣1️⃣1️⃣1️⃣1️⃣🎬")
        for imageView in imageViewList {
            print("매인스택 요청 Async::2️⃣2️⃣2️⃣2️⃣2️⃣")
            showAsyncImages(imageView: imageView)
            print("매인스택 요청 Async::3️⃣3️⃣3️⃣3️⃣3️⃣")
        }
        print("✂️매인스택 요청 Async::4️⃣4️⃣4️⃣4️⃣4️⃣44✂️")
    }
    func showAsyncImages(imageView: UIImageView) {
        DispatchQueue.global().async {
            do{
                print("어싱크시작 👺👺👺👺👺")
                guard let url = NasaAssistant.getURL else { return }
                let data = try Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    imageView.image = UIImage(data: data)
                }
                
                print("어싱크끝 😸😸😸😸😸")
            } catch {
                print("ERROR🔥🔥🔥🔥🔥🔥")
                
            }
            
        }
        
    }
    
}






extension GCDViewController {
    func defaultSetting() {
        view.backgroundColor = .systemGray6
        view.addSubview(buttonView)
        view.addSubview(imageUIView)
        
        buttonView.addSubview(syncButton)
        buttonView.addSubview(asyncButton)
        
        imageUIView.addSubview(firstImageView)
        imageUIView.addSubview(secondImageView)
        imageUIView.addSubview(thirdmageView)
        
        buttonView.backgroundColor = .systemGray2
        buttonView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 150)
        syncButton.frame = CGRect(x: 20, y: buttonView.frame.height - 50, width: UIScreen.main.bounds.width / 2 - 40, height: 40)
        asyncButton.frame = CGRect(x: buttonView.frame.width / 2 + 20, y: buttonView.frame.height - 50, width: UIScreen.main.bounds.width / 2 - 40, height: 40)
        
        
        
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
