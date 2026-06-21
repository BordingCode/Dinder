def test_hello():
    assert "hello" == "hello"

def test_addition():
    assert 1 + 1 == 2

if __name__ == "__main__":
    test_hello()
    test_addition()
    print("All tests passed!")
