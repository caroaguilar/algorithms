// Part 1:
// An anagram is a word or phrase formed by rearranging the letters of a different word or phrase
// Given 2 words, verified they are anagrams

func areAnagrams(_ s1: String, _ s2: String) -> Bool {
  if s1.count != s2.count {
    return false
  }

  var i = 0
  var j = 0
  var letters: [Character: Int] = [:]

  let firstWord = Array(s1)
  let secondWord = Array(s2)

  while i < firstWord.count {
    let letter1 = firstWord[i]
    let letter2 = secondWord[j]

    letters[letter1, default: 0] += 1
    letters[letter2, default: 0] += 1

    i+=1
    j+=1
  }

  for (_, value) in letters {
    if value % 2 != 0 {
      return false
    }
  }

  return true
}


print(areAnagrams("thing", "night"))
// Output: true
print(areAnagrams("listen", "silent"))
// Output: true
print(areAnagrams("think", "night"))
// Output: false

// Part 2:
// Given a list of words, group them in a list if they are anagrams and return a list of groups

func getAnagramGroups(_ list: [String]) -> [[String]] {

  var groups: [[String]] = []

  for word in list {
    let rest = list.filter { $0 != word }
    groups.append(getAnagramGroupsAux(word, rest))
  }

  return Array(Set(groups))
}

func getAnagramGroupsAux(_ word: String, _ list: [String]) -> [String] {
  var group: [String] = [word]

  for w in list {
    if areAnagrams(word, w) {
      group.append(w)
    }
  }

  return group
}

print(getAnagramGroups(["thing", "listen", "think", "silent", "night"]))
// Output: [["thing", "night"], ["listen", "silent"], ["think"]]