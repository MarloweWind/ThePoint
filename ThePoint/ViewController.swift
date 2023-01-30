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
    private let startButton = UIButton(type: .system)
    
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
        hitButton.isHidden = true
        hitButton.addTarget(self, action: #selector(didTapHitButton), for: .touchUpInside)
        
        standButton.translatesAutoresizingMaskIntoConstraints = false
        standButton.setTitle("Stand", for: .normal)
        standButton.tintColor = .white
        standButton.titleLabel?.font = UIFont(name: "Copperplate-Bold", size: 40)
        standButton.isHidden = true
        standButton.addTarget(self, action: #selector(didTapStandButton), for: .touchUpInside)
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.setTitle("Start", for: .normal)
        startButton.tintColor = .white
        startButton.titleLabel?.font = UIFont(name: "Copperplate-Bold", size: 40)
        startButton.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
        
        view.addSubview(gameNameLabel)
        view.addSubview(enemyScoreLabel)
        view.addSubview(playerScoreLabel)
        view.addSubview(hitButton)
        view.addSubview(standButton)
        view.addSubview(startButton)
        
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
            
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),

            ])
        
    }
    
    
    // MARK: - Private methods
    
    func gameState(state: String) {
        gameNameLabel.text = state
        hitButton.isHidden = true
        standButton.isHidden = true
        startButton.isHidden = false
        deck = [1, 1, 1, 1,
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
        startButton.setTitle("Restart?", for: .normal)
    }
    
    func hitGameStateCheck() {
        if playerScore > 21 {
            gameState(state: "Dealer Win")
        } else if enemyScore > 21 {
            gameState(state: "Player Win")
        } else if enemyScore == playerScore && enemyScore > 18 && playerScore > 18 {
            gameState(state: "Draw")
        }
    }
    
    func standGameCheck() {
        if enemyScore > playerScore {
            gameState(state: "Dealer Win")
        } else if playerScore > enemyScore {
            gameState(state: "Player Win")
        } else if enemyScore == 21 && playerScore == 21 {
            gameState(state: "Draw")
        } else if enemyScore > 21 {
            gameState(state: "Player Win")
        }
    }
    
    func enemyPlay() {
        if enemyScore == 0 {
            enemyScore += deck[0]
            deck.removeFirst()
            enemyScoreLabel.text = "Dealer score \(String(enemyScore))"
        } else if enemyScore < 16 {
            enemyScore += deck[0]
            deck.removeFirst()
            enemyScoreLabel.text = "Dealer score \(String(enemyScore))"
        } else {
            hitGameStateCheck()
        }
    }
    
    
    // MARK: - Actions

    @objc func didTapHitButton() {
        playerScore += deck[0]
        deck.removeFirst()
        playerScoreLabel.text = "Your score \(String(playerScore))"
        enemyPlay()
        hitGameStateCheck()
    }
    
    @objc func didTapStandButton() {
        hitGameStateCheck()
        standGameCheck()
        enemyPlay()
        hitButton.isHidden = true
    }
    
    @objc func didTapStartButton() {
        playerScore = 0
        enemyScore = 0
        playerScoreLabel.text = "Your score \(String(playerScore))"
        enemyScoreLabel.text = "Dealer score \(String(enemyScore))"
        
        deck.shuffle()
        hitButton.isHidden = false
        standButton.isHidden = false
        startButton.isHidden = true
        gameNameLabel.text = "The Point"
    }
    
    
}

