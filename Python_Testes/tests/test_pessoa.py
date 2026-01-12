"""
class Pessoa
    __init__
        nome str
        sobrenome str
        dados_obtidos bool (inicia False)

    API:
        obter_todos_os_dados -> method
            Ok
            404

            (dados_obtidos se torna TRUE se dados obtidos com sucesso)
"""

try:
    import sys
    import os

    sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../src")))
except:
    raise


import unittest
from unittest.mock import patch

from Pessoa import Pessoa


class TestPessoa(unittest.TestCase):
    def setUp(self):
        self.p1 = Pessoa("Felipe", "Ferreira")
        self.p2 = Pessoa("Cat", "Oliveira")

    def test_pessoa_attr_nome_tem_o_valor_corret(self):
        self.assertEqual(self.p1.nome, "Felipe")
        self.assertEqual(self.p2.nome, "Cat")

    def test_pessoa_attr_nome_é_str(self):
        self.assertIsInstance(self.p1.nome, str)
        self.assertIsInstance(self.p2.nome, str)

    def test_pessoa_attr_sobrenome_tem_o_valor_corret(self):
        self.assertEqual(self.p1.sobrenome, "Ferreira")
        self.assertEqual(self.p2.sobrenome, "Oliveira")

    def test_pessoa_attr_sobrenome_é_str(self):
        self.assertIsInstance(self.p1.sobrenome, str)
        self.assertIsInstance(self.p2.sobrenome, str)

    def test_pessoa_attr_dados_obtidos_inicia_false(self):
        self.assertFalse(self.p1.dados_obtidos)
        self.assertFalse(self.p2.dados_obtidos)

    def test_pessoa_attr_dados_obtidos_é_bool(self):
        self.assertIsInstance(self.p1.dados_obtidos, bool)
        self.assertIsInstance(self.p2.dados_obtidos, bool)

    def testar_obter_todos_os_dados_sucesso_OK(self):
        with patch("requests.get") as fake_request:
            fake_request.return_value.ok = True

            self.assertEqual(self.p1.obter_todos_os_dados(), "CONECTADO")
            self.assertTrue(self.p1.dados_obtidos)

        with patch("requests.get") as fake_request:
            fake_request.return_value.ok = True

            self.assertEqual(self.p2.obter_todos_os_dados(), "CONECTADO")
            self.assertTrue(self.p2.dados_obtidos)

    def testar_obter_todos_os_dados_sucesso_404(self):
        with patch("requests.get") as fake_request:
            fake_request.return_value.ok = False

            self.assertEqual(self.p1.obter_todos_os_dados(), "ERRO 404")
            self.assertFalse(self.p1.dados_obtidos)

        with patch("requests.get") as fake_request:
            fake_request.return_value.ok = False

            self.assertEqual(self.p2.obter_todos_os_dados(), "ERRO 404")
            self.assertFalse(self.p2.dados_obtidos)


if __name__ == "__main__":
    unittest.main(verbosity=2)
