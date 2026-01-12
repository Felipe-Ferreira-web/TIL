try:
    import sys
    import os

    sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../src")))
except:
    raise

import unittest

from calculadora import soma, subtrai


class TestCalculadora(unittest.TestCase):

    # Testes com a função somar
    def test_soma_5_e_5_deve_retornar_10(self):
        self.assertEqual(soma(5, 5), 10)

    def test_soma_varias_entradas(self):
        x_y_saidas = (
            (10, 10, 20),
            (5, -10, -5),
            (5.5, 5.5, 11.0),
            (10, 2.0, 12.0),
        )

        for x_y_saida in x_y_saidas:
            with self.subTest(x_y_saida=x_y_saida):
                x, y, saida = x_y_saida
                self.assertEqual(soma(x, y), saida)

    def test_soma_x_nao_e_int_ou_float_deve_retornar_assertionError(self):
        with self.assertRaises(AssertionError):
            soma("11", 0)

    def test_soma_x_nao_e_int_ou_float_deve_retornar_assertionError(self):
        with self.assertRaises(AssertionError):
            soma("0", "1")

    # Testes com a função subtrair
    def test_subtrai_10_e_10_deve_retornar_0(self):
        self.assertEqual(subtrai(10, 10), 0)

    def test_subtrai_varias_entradas(self):
        x_y_saidas = (
            (10, 10, 0),
            (-10, 20, -30),
            (12.5, 0.5, 12.0),
            (20, 5.5, 14.5),
        )

        for x_y_saida in x_y_saidas:
            with self.subTest(x_y_saida=x_y_saida):
                x, y, saida = x_y_saida
                self.assertEqual(subtrai(x, y), saida)

    def test_soma_x_nao_e_int_ou_float_deve_retornar_assertionError(self):
        with self.assertRaises(AssertionError):
            subtrai("11", 0)

    def test_soma_x_nao_e_int_ou_float_deve_retornar_assertionError(self):
        with self.assertRaises(AssertionError):
            subtrai("0", "1")


if __name__ == "__main__":
    unittest.main(verbosity=2)
