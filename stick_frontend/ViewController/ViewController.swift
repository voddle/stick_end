
import SwiftUI

struct ViewController: View {
    
    @ObservedObject var condition: ViewCondition
    @ObservedObject var user: User
     
    var body: some View {
        ZStack {
            if condition.isLogin == true {
                ContentView(condition: condition, user: user)
            } else {
                if condition.isSignup == true {
                    LoginView(condition: condition, user: user)
                } else {
                    SignupView(condition: condition, user: user)
                }
            }            //ContentView()
        }
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewController(condition: ViewCondition(), user: User())
    }
}
