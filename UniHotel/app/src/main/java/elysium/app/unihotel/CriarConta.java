package elysium.app.unihotel;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.text.method.LinkMovementMethod;
import android.widget.TextView;

public class CriarConta extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_criar_conta);

        //Retorna link dos termos de uso:
        TextView termosCondicoes = findViewById(R.id.txtCondicoes);
        termosCondicoes.setMovementMethod(LinkMovementMethod.getInstance());

        //Retorna link dos termos de uso:
        TextView politicaPrivacidade = findViewById(R.id.txtPolitica);
        politicaPrivacidade.setMovementMethod(LinkMovementMethod.getInstance());
    }
}