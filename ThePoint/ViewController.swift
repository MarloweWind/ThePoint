//
//  ViewController.swift
//  ThePoint
//
//  Created by Marlowe Wind on 26.01.2023.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - Properties

    private var gameNameLabel = UILabel()
    private var enemyScoreLabel = UILabel()
    private var playerScoreLabel = UILabel()
    private let hitButton = UIButton(type: .system)
    private let standButton = UIButton(type: .system)
    
    private var enemyScore = 0
    private var playerScore = 0
    private var deck = [1, 1, 1, 1,
                        2, 2, 2, 2,
                        3, 3, 3, 3,
                        4, 4, 4, 4,
                        5, 5, 5, 5,
                        6, 6, 6, 6,
                        7, 7, 7, 7,
                        8, 8, 8, 8,
                        9, 9, 9, 9,
                        10, 10, 10, 10,
                        10, 10, 10, 10,
                        10, 10, 10, 10,
                        10, 10, 10, 10,
    ]
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawing()
    }
    

    // MARK: - Drawing
    
    func drawing() {
        
        view.backgroundColor = .green
        
        gameNameLabel.translatesAutoresizingMaskIntoConstraints = false
        gameNameLabel.text = "The Point"
        gameNameLabel.font = UIFont(name: "Copperplate-Bold", size: 25)
        gameNameLabel.textColor = .white
        
        enemyScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        enemyScoreLabel.text = "Dealer score \(String(enemyScore))"
        enemyScoreLabel.font = UIFont(name: "Copperplate-Bold", size: 40)
        enemyScoreLabel.textColor = .white
        
        playerScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        playerScoreLabel.text = "Your score \(String(playerScore))"
        playerScoreLabel.font = UIFont(name: "Copperplate-Bold", size: 40)
        playerScoreLabel.textColor = .white
        
        hitButton.translatesAutoresizingMaskIntoConstraints = false
        hitButton.setTitle("Hit", for: .normal)
        hitButton.tintColor = .white
        hitButton.titleLabel?.font = UIFont(name: "Copperplate-Bold", size: 40)
        hitButton.addTarget(self, action: #selector(didTapHitButton), for: .touchUpInside)
        
        standButton.translatesAutoresizingMaskIntoConstraints = false
        standButton.setTitle("Stand", for: .normal)
        standButton.tintColor = .white
        standButton.titleLabel?.font = UIFont(name: "Copperplate-Bold", size: 40)
//        standButton.isHidden = true
        standButton.addTarget(self, action: #selector(didTapStandButton), for: .touchUpInside)
        
        view.addSubview(gameNameLabel)
        view.addSubview(enemyScoreLabel)
        view.addSubview(playerScoreLabel)
        view.addSubview(hitButton)
        view.addSubview(standButton)
        
        NSLayoutConstraint.activate([
            
            gameNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            gameNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            enemyScoreLabel.topAnchor.constraint(equalTo: gameNameLabel.bottomAnchor, constant: 60),
            enemyScoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            playerScoreLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            playerScoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            hitButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            hitButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            
            standButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            standButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),

            ])
        
    }
    
    
    // MARK: - Actions

    @objc func didTapHitButton() {
        print("hit")
    }
    
    @objc func didTapStandButton() {
        print("stand")
    }
    
    
}

