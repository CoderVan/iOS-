//: Playground - noun: a place where people can play
//import Foundation
import UIKit
//import XCPlayground
import PlaygroundSupport



class vc: UIViewController,UITableViewDataSource{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Swift3"
        view.backgroundColor = UIColor.orange
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 120, y: 20, width: 80, height: 40)
        btn.setTitle("下一页", for: .normal)
        btn.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        view.addSubview(btn)
        
        let tableView = UITableView()
        tableView.frame = CGRect(x: 0, y: 80, width: view.bounds.size.width, height: 500)
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    func nextPage() -> Void {
        self.present(vc1(), animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell");
        
        cell.textLabel?.text = "第 \(indexPath.row) 行"
        return cell
    }
}

class vc1: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.purple
        
        let label = UILabel(frame: CGRect(x: 50, y: 100, width: 200, height: 40))
        label.text = "我是第二个页面"
        label.textColor = UIColor.white
        view.addSubview(label)
        
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 120, y: 20, width: 80, height: 40)
        btn.setTitle("上一页", for: .normal)
        btn.addTarget(self, action: #selector(upPage), for: .touchUpInside)
        view.addSubview(btn)
       
    }
    
    func upPage() -> Void {
        self.dismiss(animated: true, completion: nil)
    }
}

let myview = vc()
PlaygroundPage.current.liveView = myview
