
import SwiftUI

struct ViewController: View {
    
    @ObservedObject var condition: ViewCondition
     
    var body: some View {
        ZStack {
            if condition.isLogin == true {
                ContentView(condition: condition, Net: Network())
            } else {
                if condition.isSignup == true {
                    LoginView(condition: condition, Net: Network())
                } else {
                    SignupView(condition: condition, Net: Network())
                }
            }            //ContentView()
        }
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewController(condition: ViewCondition())
    }
}
