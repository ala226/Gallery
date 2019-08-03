

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
   
    var Item = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionView.dataSource=self
        CollectionView.delegate=self
        readArrayFromPlist()
    }
    
    func readArrayFromPlist() {
        guard   let path = Bundle.main.path(forResource:"AlaaProparty", ofType: "plist") else {return }
        let url=URL(fileURLWithPath: path)
        let data=try! Data(contentsOf: url)
        let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
        let dictionary = plist as![[String:String]]
        for dic in dictionary
        {
            
            Item.append(Model(name: dic["NAME"]!, Dsc: dic["DSC"]!, imag: dic["IMAGE"]!))
        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.Image.image=UIImage(named:Item[indexPath.row].imag!)
        cell.Label.text=Item[indexPath.row].name
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: Item[indexPath.row])
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let connect=segue.destination as? ViewController2
        {
            if let food=sender as? Model
            {
                connect.Model=food
            }
        }
    }
    
    
}

