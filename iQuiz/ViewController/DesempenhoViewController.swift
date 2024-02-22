
import UIKit

class DesempenhoViewController: UIViewController {
    
    var pontuacao: Int?

    @IBOutlet weak var resultadoLabel: UILabel!
    @IBOutlet weak var percentualLabel: UILabel!
    @IBOutlet weak var botaoReiniciarQuiz: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //metodos
        configurarLayout()
        configurarDesempenho()
    }
    //estilizar layout button
    func configurarLayout() {
        navigationItem.hidesBackButton = true
        //arredondar bordas
        botaoReiniciarQuiz.layer.cornerRadius = 12.0
    }
    // calcular resultado
    func configurarDesempenho() {
        guard let pontuacao = pontuacao else { return }
        // quantidade de acertos
        resultadoLabel.text = "Você acertou \(pontuacao) de \(questoes.count) questões"
       // calcula o percentual final
        //percentual vai de 0% a 100%
        let percentual = (pontuacao * 100) / questoes.count
        percentualLabel.text = "Percentual final: \(percentual)%"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
