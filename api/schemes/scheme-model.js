// scheme-model
const db = require('../../data/db-config');

function find() {
    return db('schemes');
};

function findById(id) {
    return db('schemes').where({ id }).first();
};

function findSteps(id) {
    return db('schemes as s')
    .select('s.scheme_name', 'st.step_number', 'st.instructions')
    .join('steps as st', 's.id', '=', 'st.scheme_id')
    .where('st.scheme_id', '=', id)
    .orderBy('st.step_number');
};

async function add(scheme) {
    const [newSchemeId] = await db('schemes').insert(scheme);
    const newScheme = await findById(newSchemeId);
    return newScheme;
};

async function update(id, changes) {
    const count = await db('schemes').where({ id }).update(changes);
    const updatedScheme = await findById(id);
    return updatedScheme;
};

async function remove(id) {
    const schemeToBeRemoved = await findById(id);
    const count = await db('schemes').where({ id }).del()
    return schemeToBeRemoved;
};

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
};