import UIKit

class QuestaoViewController:
    UIViewController {
    
    var pontuacao = 0
    var numeroQuestao = 0
    
    @IBOutlet weak var tituloQuestaoLabel: UILabel!
    @IBOutlet var botoesResposta: [UIButton]!
    
    @IBAction func respostaBotaoPressionado(_ sender: UIButton) {
        //verificar se usuario acertou a resposta
        let usuarioAcertouResposta = questoes[numeroQuestao].respostaCorreta == sender.tag
        
        if usuarioAcertouResposta {
            pontuacao += 1
            // mudar a cor da questao caso acerte a questao
            sender.backgroundColor = UIColor(red: 11/255, green: 161/255, blue: 53/255, alpha: 1.0)
        } else {
            // mudar a cor da questao caso erre a questao
            sender.backgroundColor = UIColor(red: 211/255, green: 17/255, blue: 17/255, alpha: 1.0)



        }
        
        
        
        //  contar elementos do array
        if numeroQuestao < questoes.count - 1 {
          numeroQuestao += 1
          Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(configurarQuestao), userInfo: nil, repeats: false)
        } else {
            navegaParaTelaDesempenho()
        }
    }
    //navegacao
    func navegaParaTelaDesempenho() {
        performSegue(withIdentifier: "irParaTelaDesempenho", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurarLayout()
        configurarQuestao()
    }
    
    func configurarLayout() {
        // alterar numero de linhas
        tituloQuestaoLabel.numberOfLines = 0
        // organizar o alinhamento do texto
        tituloQuestaoLabel.textAlignment = .center
        navigationItem.hidesBackButton = true
        for botao in botoesResposta {
            botao.layer.cornerRadius = 12.0
        }
    }
    
    @objc func configurarQuestao() {
        // propriedade para alterar o texto de uma label
            tituloQuestaoLabel.text = questoes[numeroQuestao].titulo
            for botao in botoesResposta {
                //constante para armazenar titulo do botao
                let tituloBotao = questoes[numeroQuestao].respostas[botao.tag]
                //metodo para mudar titulo da questao
                botao.setTitle(tituloBotao, for: .normal)
                            botao.backgroundColor = UIColor(red: 116/255, green: 50/255, blue: 255/255, alpha: 1.0)
            }
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //verificar se a tela de destino é a DesempenhoViewController
            guard let desempenhoVC = segue.destination as? DesempenhoViewController else { return }
        // acessa todos os atributos e metodos da classe DesempenhoViewController
            desempenhoVC.pontuacao = pontuacao
        }
}

