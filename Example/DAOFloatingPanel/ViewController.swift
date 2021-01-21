//
//  ViewController.swift
//  DAOFloatingPanel
//
//  Created by ray on 01/21/2021.
//  Copyright (c) 2021 ray. All rights reserved.
//

import UIKit
import DAOFloatingPanel

class ViewController: UIViewController {
  lazy var normalPanel: DAOFloatingPanelViewController = {
    let panel = DAOFloatingPanelViewController(type: .normal)
    panel.delegate = self
    
    return panel
  }()
  
  lazy var extendablePanel: DAOFloatingPanelViewController = {
    let panel = DAOFloatingPanelViewController(type: .extendable)
    panel.delegate = self
    
    return panel
  }()
  
  @IBAction func showPanel(_ sender: Any) {
    self.present(normalPanel, animated: false, completion: nil)
  }
  
  @IBAction func showExtendablePanel(_ sender: Any) {
    self.present(extendablePanel, animated: false, completion: nil)
  }
  
}

extension ViewController: FloatingPanelDelegate {
  func setupFloatingPanelContentUI(panel: DAOFloatingPanelViewController) {
    
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    
    switch panel {
    case normalPanel:
      label.text = "normal"
    
    case extendablePanel:
      label.text = "extendable"
      
    default:
      break
    }
    
    panel.contentView.addSubview(label)
    
    NSLayoutConstraint.activate([
      label.centerXAnchor.constraint(equalTo: panel.contentView.centerXAnchor),
      label.centerYAnchor.constraint(equalTo: panel.contentView.centerYAnchor)
    ])
  }
  
}

