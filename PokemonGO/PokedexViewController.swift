//
//  PokedexViewController.swift
//  PokemonGO
//
//  Created by Jhosep Bazan on 21/11/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class PokedexViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var pokemonsAtrapados:[Pokemon] = []
    var pokemonsNoAtrapados:[Pokemon] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        pokemonsAtrapados = obtenerPokemonsAtrapados()
        pokemonsNoAtrapados = obtenerPokemonsNoAtrapados()
        //self.tableView.isEditing = true
    
    }
    
    @IBAction func mapTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return pokemonsAtrapados.count
            
        }else{
            return pokemonsNoAtrapados.count
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pokemon : Pokemon
        if indexPath.section == 0{
            pokemon = pokemonsAtrapados[indexPath.row]
            
        }else{
            pokemon = pokemonsNoAtrapados[indexPath.row]

        }
        let cell = UITableViewCell()
        cell.textLabel?.text = pokemon.nombre
        cell.imageView?.image = UIImage(named: pokemon.imagenNombre!)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Atrapados"
        }else{
            return "No atrapdos"
        }
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            return true
        }else{
            return false
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let pokemon = pokemonsAtrapados.remove(at: indexPath.row)
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            pokemon.atrapado = false
            pokemonsAtrapados = obtenerPokemonsAtrapados()
            pokemonsNoAtrapados = obtenerPokemonsNoAtrapados()
            tableView.reloadData()
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
    }
    
    /* Eliminar pokemon al solo tocar una celda
     
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemon = pokemonsAtrapados[indexPath.row]
        print(pokemon)
        do{
            pokemon.atrapado = false
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            pokemonsAtrapados = obtenerPokemonsAtrapados()
            pokemonsNoAtrapados = obtenerPokemonsNoAtrapados()
            tableView.reloadData()
        }catch{
            
        }
        
    }*/
    


    

}
