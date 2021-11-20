package elysium.app.unihotel;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import elysium.app.unihotel.ui.login.LoginActivity;

public class MainActivity extends AppCompatActivity {
    private Button btnCadastrar;
    private Button btnLogin;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btnCadastrar = (Button) findViewById(R.id.btnCadastrar);
        btnLogin = (Button) findViewById(R.id.btnLogin);

        btnCadastrar.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View view)
            {
                btnCadastrarActivity();
            }
        });

        btnLogin.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View view)
            {
                btnLoginActivity();
            }
        });
    }

    private void btnCadastrarActivity()
    {
        startActivity(new Intent(MainActivity.this, CriarConta.class));
    }

    private void btnLoginActivity()
    {
        startActivity(new Intent(MainActivity.this, LoginActivity.class));
    }

}
