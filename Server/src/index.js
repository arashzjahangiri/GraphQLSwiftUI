const { ApolloServer } = require('apollo-server');

const typeDefs = `
type Query {
  reminders: [Reminder]
}

type Mutation {
  post(title: String!, description: String): Reminder!,
  updateStatus(id: Int!, status: Boolean): Reminder!,
  delete(id: Int!): Boolean!,
}

type Reminder {
  id: Int!
  title: String!
  description: String
  status: Boolean!
}
`

let reminders = [{
  id: 1,
  title: `shoping`,
  description: `egg, water, sugar`,
  status: false
}]

var idCounter = 2

const resolvers = {
  Query: {
    reminders: () => reminders,
  },
  Mutation: {
    post: (parent, args) => {
      const reminder = {
        id: idCounter++,
        title: args.title,
        description: args.description,
        status: false
      }
      reminders.push(reminder)
      console.log(reminders.length)
      return reminder
    },
    updateStatus: (parent, args) => {
      const reminder = reminders.find(item => 
        item.id === args.id)
      if (!reminder) {
        throw new Error(`Couldn't find reminder with id ${args.id}`)
      }
      reminder.status = args.status
      return reminder
    },
    delete: (parent, args) => {
      const reminder = reminders.find(item => 
        item.id === args.id)
      if (!reminder) {
        throw new Error(`Couldn't find reminder with id ${args.id}`)
      }
      const index = reminders.indexOf(reminder);
      if (index > -1) {
        reminders.splice(index, 1);
        return true
      } else {
        return false
      }
    }
  },
}

const server = new ApolloServer({
  typeDefs: typeDefs,
  resolvers
})

server
.listen()
.then(({ url }) =>
  console.log(`Server is running on ${url}`)
  );
