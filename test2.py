def test_string_length():
    assert len("Dinder") == 6

def test_list_contains():
    dishes = ["pizza", "sushi", "tacos"]
    assert "sushi" in dishes

def test_dictionary():
    dish = {"name": "pizza", "rating": 5}
    assert dish["rating"] == 5

if __name__ == "__main__":
    test_string_length()
    test_list_contains()
    test_dictionary()
    print("All tests passed!")
